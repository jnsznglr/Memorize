//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jonas Zingler on 19.06.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//  ViewModel

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","🎃","☠️","🕷","😈","💩","💀","🤖","🕸","🧛🏻‍♂️","🧛🏻‍♀️","🧟‍♂️"].shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: Int.random(in: 2..<6)){ pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    // MARK: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
 
