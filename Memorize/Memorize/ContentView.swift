//
//  ContentView.swift
//  Memorize
//
//  Created by JohnnyZ on 30/4/2022.
//

import SwiftUI

struct ContentView: View {
    var viewModel : EmojiMemoryGame
    
    @State var emojiCount = 16
    var body: some View {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards){ card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                    
                }
            }
            .padding(.horizontal)
            Spacer()
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
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}
