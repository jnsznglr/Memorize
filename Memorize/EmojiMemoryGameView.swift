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
    
    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card).onTapGesture{
                    self.viewModel.choose(card: card) // self will gonna be fixed here in the future
                }
            }
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
    
    func body(for size: CGSize) -> some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: cornerRadius).stroke(lineWidth: edgeLineWidth)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: cornerRadius).fill()
            
            }
        
        }
        .aspectRatio(2/3, contentMode: .fit)
        .font(Font.system(size: fontSize(for: size)))
    }
    
    // MARK: - Drawing Constants
    
    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 4
    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * 0.75
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
