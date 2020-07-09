//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Jonas Zingler on 18.06.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//  MVVM - View

import SwiftUI                          // imports package "SwiftUI"





struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
//    @ViewBuilder
//    private func body(for size: CGSize) -> some View {
//            Button(action: {print("Hello World")}) {
//                Text("New Game")
//            }
//        }
    
    var body: some View {
        Grid(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    self.viewModel.choose(card: card)
                }
                .padding(5)
            }
                .padding()
                .foregroundColor(Color.orange)
    }
}



struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        GeometryReader{geometry in
            self.body(for: geometry.size)
        }
    }
    @ViewBuilder // interprets the function below as a list of views
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched{
            ZStack {
                Pie(startAngle: Angle.degrees(0-90), endAngle: Angle.degrees(120-90), clockwise: true)
                    .padding(5)
                    .opacity(0.4)
                Text(card.content)
                    .font(Font.system(size: fontSize(for: size)))
            }
            .cardify(isFaceUp: card.isFaceUp) // self build modifier for card layout
        }
    }
        
    
    // MARK: - Drawing Constants
    

   private func fontSize(for size: CGSize) -> CGFloat {
            min(size.width, size.height) * 0.7
    }
}




// Just for Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return EmojiMemoryGameView(viewModel: game)
    }
}
