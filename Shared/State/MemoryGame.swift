//
//  MemoryGame.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import Foundation

@MainActor class MemoryGame: ObservableObject {
    @Published private(set) var pages: [MemoryGamePage] = []
    @Published var currentMemoryId = 0
    @Published var currentPage = 0
    @Published var idsDiscovered: [Int] = []
    
    struct Constants {
        static let PageSize = 9
    }
    
    var cards: [Card] {
        if pages.count > 0 {
            return pages[currentPage].items
        }
        
        return []
    }
    
    var memoryCard: Card? {
        cards.first(where: { $0.id == currentMemoryId }) ?? nil
    }
    
    var itemsForGrid: [Card] {
        return cards
    }
    
    var currentAmountOfItemsInGrid: Int {
        itemsForGrid.count
    }
    
    func hasDiscovered (id: Int) -> Bool {
        return idsDiscovered.contains(id)
    }
    
    func initWith(pages: [MemoryGamePage]) {
        self.pages = pages
        shuffle()
    }
    
    func onDidDiscoveredCurrent() {
        idsDiscovered.append(currentMemoryId)
        shuffle()
    }
    
    func shuffle() {
        let itemsDiscovered = itemsForGrid.filter ({ hasDiscovered(id: $0.id) }).count
        let hasDiscoveredAll = itemsDiscovered == currentAmountOfItemsInGrid
        
        if hasDiscoveredAll {
            goToNextPage()
            return
        }
        
        while(true) {
            let id = tryNextMemoryId()
            if (!hasDiscovered(id: id)) {
                currentMemoryId = id
                return
            }
        }
    }
    
    func tryNextMemoryId() -> Int {
        return itemsForGrid.randomElement()?.id ?? 0
    }
    
    func goToNextPage() {
        if (currentPage < pages.count - 1) {
            idsDiscovered = []
            currentPage += 1
            currentMemoryId = tryNextMemoryId()
        } else {
            print("Finished!") // TODO: show a nice popup here
            idsDiscovered = []
            currentPage = 0
            currentMemoryId = tryNextMemoryId()
        }
    }
    
    func goToPage (with index: Int) {
        currentPage = index
        idsDiscovered = []
        currentMemoryId = tryNextMemoryId()
    }
    
    struct MemoryGamePage: Identifiable {
        var id = UUID()
        var items: [Card] = []
        var title: String = ""
    }

    struct Card: Identifiable {
        var id: Int
        var title: String
        var thumbnailImage: String
        var videoPath: String?
    }
}
