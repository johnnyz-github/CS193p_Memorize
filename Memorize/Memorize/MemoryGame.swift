//
//  MemoryGame.swift
//  Memorize
//
//  Created by JohnnyZ on 1/5/2022.
//

import Foundation
struct MemoryGame<CardContent>{
    private(set) var cards : [Card]
    mutating func choose(_ card : Card){
        cards[index(of: card)] .isFaceUp.toggle()
    }
    func index (of card: Card) -> Int {
        for i in 0..<cards.count{
            if cards[i].id == card.id{
                return i
            }
        }
        return 0
    }
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent){
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards{
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
    }
    struct Card: Identifiable{
        var isFaceUp = false
        var isMatched = false
        var content : CardContent
        var id : Int
    }
}
