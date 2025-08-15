//
//  ContentView.swift
//  Memorize
//
//  Created by Iana Arkhipova on 07.08.2025.
//

import SwiftUI

//struct ContentView: View {
////    let emojis: Array<String> = ["👻","🎃","🕷️","😈"] - вариант объявления array
////    let emojis: [String] = ["👻","🎃","🕷️","😈"] - вариант объявления array
//    let emojis = ["👻","🎃","🕷️","😈","💀","🕸️","🧙‍♀️","🙀","👹","😱","☠️","🍭"]
//    
//    @State var cardCount: Int = 4
//    
//    var body: some View {
//        VStack {
//            ScrollView {
//                cards
//            }
//            Spacer()
//            cardCountAdjuaters
//        }
//        .padding()
//    }
//    
//    var cards: some View {
//        LazyVGrid(columns: [GridItem(.adaptive(minimum:120))]) {
//            ForEach(0..<cardCount, id: \.self) { index in
//                CardView(content: emojis[index])
//                    .aspectRatio(2/2, contentMode: .fit)
//            }
//        }
//        .foregroundColor(.orange)
//    }
//    
//    var cardCountAdjuaters: some View {
//        HStack {
//            cardRemover
//
//            Spacer()
//            
//            cardAdder
//        }
//        .imageScale(.large)
//        .font(.largeTitle)
//    }
//    
//    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
//        Button(action: {
//                cardCount += offset
//        }, label: {
//            Image(systemName: symbol)
//        })
//        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
//    }
//    
//    var cardRemover: some View {
//        cardCountAdjuster(by: -1, symbol: "circle.badge.minus")
//    }
//    
//    var cardAdder: some View {
//        cardCountAdjuster(by: +1, symbol: "circle.badge.plus.fill")
//    }
//    
//}
//
//struct CardView: View {
//    let content: String
//    @State var isFaceUp = true
//    
//    var body: some View {
//        ZStack {
//            let base = Circle()
//            Group {
//                base.fill(.white)
//                base.strokeBorder(lineWidth: 2)
//                Text(content).font(.largeTitle)
//            }
//            .opacity(isFaceUp ? 1 : 0)
//            base.fill().opacity(isFaceUp ? 0 : 1) // если isFaceUp == true тогда 0, если false тогда 1
//            
//        }.onTapGesture {
//            isFaceUp.toggle()
//        }
//    }
//}


//------------------------------------------------------------------//

struct ContentView: View {
    
    let emojisHalloween: Array<String> = ["👻","🕷️","🍭","☠️","🧙‍♀️","😱","👹","😈","💀","🕸️","🙀","🎃"]
    let emogisCar: Array<String> = ["🚗","🚙","🏎️","🚕","🚓","🚘","🚖","🚔"]
    let emogisFrut: Array<String> = ["🍑","🍐","🍋","🥭","🥝","🍏","🍊","🍌","🍉"]
    
    @State var countCard: Int = 16
    @State  var showSecondScreen = false
    @State  var theme: [String] = []
    @State  var title: String = ""
    
    var body: some View {
        let repeatedColors = (Array(repeating: theme, count: 2).flatMap { $0 }).shuffled()
        VStack {
            if !showSecondScreen {
                ZStack {
                    HStack {
                        CardBackgroundView()
                    }
                    
                    ZStack {
                        // прозрачный белый прямоугольник
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.white).opacity(0.7)
                            .frame(height: UIScreen.main.bounds.height / 2)
                        
                        VStack{
                            Text("Memorize!")
                                .font(.largeTitle)
                            //                    Text(emojisHalloween.joined(separator: ", "))
                                .padding(.bottom, 50)
                            HStack {
                                VStack {
                                    Button {
                                        title = "Halloween"
                                        theme = emojisHalloween
                                        withAnimation {
                                            showSecondScreen = true
                                        }
                                    } label: {
                                        Image(systemName: "theatermasks.fill")
                                            .padding(5)
                                    }
                                    .buttonBorderShape(.capsule)
                                    .buttonStyle(.bordered)
                                    
                                    Text ("Halloween")
                                }
                                Spacer()
                                VStack {
                                    Button {
                                        title = "Cars"
                                        theme = emogisCar
                                        withAnimation {
                                            showSecondScreen = true
                                        }
                                    } label: {
                                        Image(systemName: "car.side.fill")
                                            .padding(.vertical, 9)
                                            .padding(.horizontal, 5)
                                    }
                                    
                                    .buttonBorderShape(.capsule)
                                    .buttonStyle(.bordered)
                                    
                                    
                                    Text("Cars")
                                }
                                Spacer()
                                VStack {
                                    Button {
                                        title = "Fruts"
                                        theme = emogisFrut
                                        withAnimation {
                                            showSecondScreen = true
                                        }
                                    } label: {
                                        Image(systemName: "leaf.fill")
                                            .padding(.vertical, 8)
                                            .padding(.horizontal, 10)
                                    }
                                    .buttonBorderShape(.capsule)
                                    .buttonStyle(.bordered)
                                    
                                    Text("Fruts")
                                }
                            }.padding(.horizontal, 75)
                            
                        }
                    }
                    
                }
            } else {
                VStack {
                    Text(title)
                        .font(.title.bold())
                    Spacer ()
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 48))]) {
                        ForEach(0..<repeatedColors.count, id: \.self) {index in
                            CardView(content: repeatedColors[index] )
                                .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                    .foregroundColor(.orange)
                    .padding(.horizontal)
                    Spacer ()
                    Button("назад") {
                        withAnimation {
                            showSecondScreen = false
                        }
                    }
                }
            }
            
        }
        
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = true
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
                    
            }
            .opacity(isFaceUp ? 0 : 1)
            base.fill().opacity(isFaceUp ? 1 : 0)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}



struct CardBackgroundView: View {
    let colors: [Color] = [.red, .gray, .green, .blue, .yellow, .indigo]
    var body: some View {
        
        let repeatedColors = Array(repeating: colors, count: 11).flatMap { $0 }
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 30))]) {
            ForEach (0..<repeatedColors.count, id: \.self) { index in
                RoundedRectangle(cornerRadius: 13)
                    .fill(repeatedColors[index])
                    .frame(height: UIScreen.main.bounds.height / 2)
            }
        }
    }
    
}




#Preview {
    ContentView()
}
