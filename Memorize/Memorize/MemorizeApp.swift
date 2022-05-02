//
//  MemorizeApp.swift
//  Memorize
//
//  Created by JohnnyZ on 30/4/2022.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
