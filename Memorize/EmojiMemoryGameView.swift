//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Iana Arkhipova on 07.08.2025.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    
    @ObservedObject  var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum:85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/2, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(Color.orange)
    }
    
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_  card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = Circle()
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1.5, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1) // если isFaceUp == true тогда 0, если false тогда 1
            
        }
    }
}

// let - константа, var - переменная
//------------------------------------------------------------------//

//struct EmojiMemoryGameView: View {
//    
//    let emojisHalloween: Array<String> = ["👻","🕷️","🍭","☠️","🧙‍♀️","😱","👹","😈","💀","🕸️","🙀","🎃"]
//    let emogisCar: Array<String> = ["🚗","🚙","🏎️","🚕","🚓","🚘","🚖","🚔"]
//    let emogisFrut: Array<String> = ["🍑","🍐","🍋","🥭","🥝","🍏","🍊","🍌","🍉"]
//    
//    @State var countCard: Int = 16
//    @State  var showSecondScreen = false
//    @State  var theme: [String] = []
//    @State  var title: String = ""
//    
//    var body: some View {
//        let repeatedColors = (Array(repeating: theme, count: 2).flatMap { $0 }).shuffled()
//        VStack {
//            if !showSecondScreen {
//                ZStack {
//                    HStack {
//                        CardBackgroundView()
//                    }
//                    
//                    ZStack {
//                        // прозрачный белый прямоугольник
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(.white).opacity(0.7)
//                            .frame(height: UIScreen.main.bounds.height / 2)
//                        
//                        VStack{
//                            Text("Memorize!")
//                                .font(.largeTitle)
//                            //                    Text(emojisHalloween.joined(separator: ", "))
//                                .padding(.bottom, 50)
//                            HStack {
//                                VStack {
//                                    Button {
//                                        title = "Halloween"
//                                        theme = emojisHalloween
//                                        withAnimation {
//                                            showSecondScreen = true
//                                        }
//                                    } label: {
//                                        Image(systemName: "theatermasks.fill")
//                                            .padding(5)
//                                    }
//                                    .buttonBorderShape(.capsule)
//                                    .buttonStyle(.bordered)
//                                    
//                                    Text ("Halloween")
//                                }
//                                Spacer()
//                                VStack {
//                                    Button {
//                                        title = "Cars"
//                                        theme = emogisCar
//                                        withAnimation {
//                                            showSecondScreen = true
//                                        }
//                                    } label: {
//                                        Image(systemName: "car.side.fill")
//                                            .padding(.vertical, 9)
//                                            .padding(.horizontal, 5)
//                                    }
//                                    
//                                    .buttonBorderShape(.capsule)
//                                    .buttonStyle(.bordered)
//                                    
//                                    
//                                    Text("Cars")
//                                }
//                                Spacer()
//                                VStack {
//                                    Button {
//                                        title = "Fruts"
//                                        theme = emogisFrut
//                                        withAnimation {
//                                            showSecondScreen = true
//                                        }
//                                    } label: {
//                                        Image(systemName: "leaf.fill")
//                                            .padding(.vertical, 8)
//                                            .padding(.horizontal, 10)
//                                    }
//                                    .buttonBorderShape(.capsule)
//                                    .buttonStyle(.bordered)
//                                    
//                                    Text("Fruts")
//                                }
//                            }.padding(.horizontal, 75)
//                            
//                        }
//                    }
//                    
//                }
//            } else {
//                VStack {
//                    Text(title)
//                        .font(.title.bold())
//                    Spacer ()
//                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 48))]) {
//                        ForEach(0..<repeatedColors.count, id: \.self) {index in
//                            CardView(content: repeatedColors[index] )
//                                .aspectRatio(2/3, contentMode: .fit)
//                        }
//                    }
//                    .foregroundColor(.orange)
//                    .padding(.horizontal)
//                    Spacer ()
//                    Button("назад") {
//                        withAnimation {
//                            showSecondScreen = false
//                        }
//                    }
//                }
//            }
//            
//        }
//        
//    }
//}
//
//struct CardView: View {
//    let content: String
//    @State var isFaceUp = true
//    
//    var body: some View {
//        ZStack {
//            let base = RoundedRectangle(cornerRadius: 12)
//            Group {
//                base.fill(.white)
//                base.strokeBorder(lineWidth: 2)
//                Text(content).font(.largeTitle)
//                    
//            }
//            .opacity(isFaceUp ? 0 : 1)
//            base.fill().opacity(isFaceUp ? 1 : 0)
//            
//        }.onTapGesture {
//            isFaceUp.toggle()
//        }
//    }
//}
//
//
//
//struct CardBackgroundView: View {
//    let colors: [Color] = [.red, .gray, .green, .blue, .yellow, .indigo]
//    var body: some View {
//        
//        let repeatedColors = Array(repeating: colors, count: 11).flatMap { $0 }
//        
//        LazyVGrid(columns: [GridItem(.adaptive(minimum: 30))]) {
//            ForEach (0..<repeatedColors.count, id: \.self) { index in
//                RoundedRectangle(cornerRadius: 13)
//                    .fill(repeatedColors[index])
//                    .frame(height: UIScreen.main.bounds.height / 2)
//            }
//        }
//    }
//    
//}

 


#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
