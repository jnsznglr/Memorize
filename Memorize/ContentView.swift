//
//  ContentView.swift
//  Memorize
//
//  Created by Jonas Zingler on 18.06.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//  MVVM - View

import SwiftUI                          // imports package "SwiftUI"

struct ContentView: View {
    var viewModel: EmojiMemoryGame
    
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
            
        //if numberOfPairsOfCards < 4{
            .font(Font.largeTitle)
        //} else{
        //    .font(Font.largeTitle)
        //}
        
    }
}

struct CardView: View {
    var card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 4)
                //RoundedRectangle(cornerRadius: 10.0).frame(width:2/3*height)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
