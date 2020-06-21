//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Jonas Zingler on 19.06.20.
//  Copyright © 2020 Jonas Zingler. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame {
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["👻","💩","☠️"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count){ pairIndex in
            return emojis[pairIndex]
        }
    }
        
    
    // Mark: - Access to the Model
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // Mark: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
