//
//  MemoryGameApp.swift
//  Shared
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI
import AVFoundation

@main
struct MemoryGameApp: App {
    @StateObject var memoryGame = MemoryGame()
    @StateObject var modalState = ModalState()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                GridScreen(selectedCard: createFuenteAlemo()[0].items[0])
                    .background {
                        SickBackground()
                    }
                Modal()
            }
            .environmentObject(memoryGame)
            .environmentObject(modalState)
            .onAppear {
                memoryGame.initWith(pages: createFuenteAlemo())
                initAudio()                
            }
        }
    }
    
    func initAudio () {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, options: [.mixWithOthers])
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print(error)
        }
    }
}
