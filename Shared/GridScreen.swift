//
//  ContentView.swift
//  Shared
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI

struct GridScreen: View {
    @EnvironmentObject var memoryGame: MemoryGame
    @EnvironmentObject var modalState: ModalState
    @StateObject var soundState = PlaySoundState()
    
    @State var selectedCard: MemoryGame.Card {
        didSet {
            isPresented = true
        }
    }
    @State var isPresented = false
    
    var body: some View {
        VStack {
            if deviceIdiom == .pad {
                HStack(alignment: .center) {
                    GridScreenHeader()
                }
                .padding(.horizontal)
                
            } else {
                VStack {
                    GridScreenHeader()
                }
            }
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 200))]) {
                    ForEach(memoryGame.itemsForGrid) { card in
                        CardView(card: card) { pressedCard in
                            let choseTheCorrectCard = pressedCard.id == memoryGame.memoryCard?.id
                            
                            if (choseTheCorrectCard) {
                                soundState.playSound(named: .correct)
                                selectedCard = pressedCard
                                memoryGame.onDidDiscoveredCurrent()
                            } else {
                                soundState.playSound(named: .failDunk)
                                withAnimation {
                                    modalState.isShowed.toggle()
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .padding()
            .fullScreenCover(isPresented: $isPresented, onDismiss: { isPresented = false }, content: {
                VideoScreen(card: $selectedCard)
            })
        }
        
    }
}

//struct GridScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        GridScreen()
//    }
//}
