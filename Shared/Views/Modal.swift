//
//  Modal.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 19/03/2022.
//

import SwiftUI

struct Modal: View {
    @EnvironmentObject var modalState: ModalState
    @StateObject var soundState = PlaySoundState()
    
    var body: some View {
        if modalState.isShowed {
            ZStack {
                Color.black.opacity(0.9)
                
                Text("🙅‍♀️")
                    .font(.system(size: 100))
                    .scaleEffect(2)
            }
            .onTapGesture {
                soundState.playSound(named: .bounce)
                modalState.isShowed.toggle()
            }
            .ignoresSafeArea()
        }
    }
}

struct Modal_Previews: PreviewProvider {
    static var previews: some View {
        Modal()
    }
}
