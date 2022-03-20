//
//  CardView.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI

struct CardView: View {
    @Environment(\.colorScheme) var colorScheme
    let width: CGFloat = 180
    let height: CGFloat = 220
    
    var card: MemoryGame.Card
    var onPress: (MemoryGame.Card) -> ()
    
    
    var body: some View {
        Button(action: {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            onPress(card)
        }, label: {
            BgCard() {
                VStack {
                    Image(card.thumbnailImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height, alignment: .center)
                        .clipped()
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        
                    Text(card.title)
                        .foregroundColor(Color("RedDark"))
                        .font(.system(size: 20, weight: .heavy, design: .rounded))
                        .multilineTextAlignment(.center)
                        .padding()
                }
            }
        })
    }
}

// currently not used. but if needed: .cornerRadius(20, corners: [.topLeft, .topRight])
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}


struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let items = createFuenteAlemo().first?.items ?? []
        if let item = items.filter({ $0.thumbnailImage == "colors" }).first {
            CardView(card: item) {_ in
                print("on press")
            }
            .frame(width: 150, height: 200)
        }
    }
}
