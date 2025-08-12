//
//  ContentView.swift
//  Memorize
//
//  Created by Iana Arkhipova on 07.08.2025.
//

import SwiftUI

struct ContentView: View {
//    let emojis: Array<String> = ["👻","🎃","🕷️","😈"] - вариант объявления array
//    let emojis: [String] = ["👻","🎃","🕷️","😈"] - вариант объявления array
    let emojis = ["👻","🎃","🕷️","😈","😈"]
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index])
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = Circle()
            if isFaceUp {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
