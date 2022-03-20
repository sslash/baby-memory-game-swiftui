//
//  ButtonStyle.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI


struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color("Green"))
            .foregroundColor(.white)
            .clipShape(Capsule())
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
