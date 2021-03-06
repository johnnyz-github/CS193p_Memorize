//
//  ContentView.swift
//  Memorize
//
//  Created by JohnnyZ on 30/4/2022.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚙", "🛴", "✈️", "🛵", "⛵️", "🚎", "🚐", "🚛",
                             "🛻", "🏎", "🚂", "🚊", "🚀", "🚁", "🚢", "🛶",
                             "🛥", "🚞", "🚤", "🚲", "🚡", "🚕", "🚟", "🚃"]
    @State var emojiCount = 16
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns:[GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self){ emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                    
                }
            }
            
        .padding(.horizontal)
            Spacer()
            HStack{
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding()
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.red/*@END_MENU_TOKEN@*/)
    }
    var remove : some View{
        Button {
            if emojiCount < emojis.count{
            emojiCount += 1
            }} label:
        {
            Image(systemName: "minus.circle")
        }
    }
    var add : some View{
        Button {
            if emojiCount > 1{
            emojiCount -= 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
        
    }
}
struct CardView : View{
    var content: String
    @State var isFaceUp : Bool = true
    var body: some View{
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp{
                shape .fill() .foregroundColor(.white)
                shape .strokeBorder(lineWidth: 3)
                Text(content) .font(.largeTitle) .foregroundColor(.orange)
            }else{
                shape .fill() .foregroundColor(.red)
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
    }
}
