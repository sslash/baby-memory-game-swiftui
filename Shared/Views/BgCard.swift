//
//  BgCard.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI

struct BgCard<Content: View>: View {
    @Environment(\.colorScheme) var colorScheme    
    var content: Content
    var padding: CGFloat
    
    init (padding: CGFloat? = nil, content: () -> Content) {
        self.content = content()
        self.padding = padding ?? 10
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(.ultraThinMaterial).opacity(colorScheme == .dark ? 1 : 1)
            
            content
                .padding()
        }
    }
}

struct BgCard_Previews: PreviewProvider {
    static var previews: some View {
        BgCard {
            Text("Sap")
        }
    }
}
