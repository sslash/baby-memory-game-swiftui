//
//  ModalState.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 19/03/2022.
//

import Foundation

@MainActor
class ModalState: ObservableObject {
    @Published var isShowed: Bool
    
    init () {
        isShowed = false
    }
}
