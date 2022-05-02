//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JohnnyZ on 1/5/2022.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    static var emojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
                             "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
                             "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 14){ pairIndex in
            emojis[pairIndex]
       }
    }
    private(set) var model = createMemoryGame() 
    
    var cards : Array<MemoryGame<String>.Card>{
        return model.cards
    }
    func choose(_ card : MemoryGame<String>.Card){
        model.choose(card)
    }
}
