//
//  ContentView.swift
//  Memorize
//
//  Created by JohnnyZ on 30/4/2022.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game : EmojiMemoryGame
    
    @State var emojiCount = 10
    var body: some View {

        AspectVGrid(items : game.cards,aspectRatio: 2/3, content: { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
        })
            
            .padding(.horizontal)
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
   
}
struct CardView : View{
    var card : MemoryGame<String>.Card
    @State var isFaceUp : Bool = true
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp{
                shape .fill() .foregroundColor(.white)
                shape .strokeBorder(lineWidth: 3)
                Text(card.content) .font(.largeTitle) .foregroundColor(.orange)
            }else{
                shape .fill() .foregroundColor(.red)
            }
        }
        
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.dark)
        EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
