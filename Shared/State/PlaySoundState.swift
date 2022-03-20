//
//  PlaySoundState.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 19/03/2022.
//

import Foundation
import AVFoundation

enum GameSound: String {
    case bounce = "bounce.mp3"
    case failDunk = "failDunk.mp3"
    case correct = "success.mp3"
}

class PlaySoundState: ObservableObject {
    let bounceSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "bounce.mp3", withExtension: nil)!)
    let failSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "failDunk.mp3", withExtension: nil)!)
    let successSound = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "success.mp3", withExtension: nil)!)

    func playSound (named sound: GameSound) {
        switch (sound) {
        case .bounce:
            bounceSound.play()
            
        case .failDunk:
            failSound.play()
            
        case .correct:
            successSound.play()
        }
    }
    
}
