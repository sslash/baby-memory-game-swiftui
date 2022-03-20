//
//  GridScreenHeader.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 19/03/2022.
//

import SwiftUI

struct GridScreenHeader: View {
    @EnvironmentObject var memoryGame: MemoryGame
    @StateObject var soundState = PlaySoundState()
    
    var body: some View {
        if let card = memoryGame.memoryCard {
            Text("Wo ist der: \(card.title) ?")
                .font(.system(size: 38, weight: .bold, design: .rounded))
                .foregroundColor(.primary)
                .padding()
        }
        if deviceIdiom == .pad {
            Spacer()
        }
        
        if memoryGame.pages.count > 0 {
            HStack {
                ForEach(memoryGame.pages.indices) { index in
                    let page = memoryGame.pages[index]
                    Button(action: {
                        soundState.playSound(named: .bounce)
                        withAnimation {
                            memoryGame.goToPage(with: index)
                        }
                    }, label: {
                        Text(page.title)
                            .font(.system(size: 38, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .frame(width: 58, height: 48)
                            .background(Color("Green"))
                            .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                            .shadow(color: Color("GreenShadowLight"), radius: 2, x: 2, y: 2)
                    })
                }
            }
        }
    }
}
