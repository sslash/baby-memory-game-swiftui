//
//  VideoScreen.swift
//  MemoryGame (iOS)
//
//  Created by michael gunnulfsen on 13/03/2022.
//

import SwiftUI
import AVKit

struct VideoScreen: View {
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var card: MemoryGame.Card
    @State var player: AVPlayer = AVPlayer()
    
    var body: some View {
        ZStack{
            Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
            VStack {
                Text(card.title)
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                VideoPlayer(player: player)
                    .frame(width: UIScreen.main.bounds.size.width)
                
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Tilbake")
                        .fontWeight(.bold)
                        .font(.title)
                        .padding()
                        .background(Color.pink)
                        .cornerRadius(40)
                        .foregroundColor(.white)
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(Color.pink, lineWidth: 5)
                        )
                })
                    .padding(50)
                
            }
            
        }
        .background(BackgroundBlurView().edgesIgnoringSafeArea(.all))
        .onAppear {
            if let bundle = Bundle.main.url(forResource: card.videoPath!, withExtension: "mp4") {
                player = AVPlayer(url:  bundle)
                player.play()
            }
        }
    }
    
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

//struct VideoScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        VideoScreen(card: createFuenteAlemo()[0])
//    }
//}
