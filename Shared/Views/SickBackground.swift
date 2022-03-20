//
//  SickBackground.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI

struct SickBackground: View {
    var body: some View {
        ZStack {
            VStack {
                Circle()
                    .fill(Color("Green"))
                    .scaleEffect(0.6, anchor: .trailing)
                    .offset(x: 20)
                    .blur(radius: 120)
                
                Circle()
                    .fill(Color("Red"))
                    .scaleEffect(0.6, anchor: .leading)
                    .offset(x: -20)
                    .blur(radius: 120)
            }
        }
        .ignoresSafeArea()
        .background(Color("BG"))
    }
}

struct SickBackground_Previews: PreviewProvider {
    static var previews: some View {
        SickBackground()
    }
}
