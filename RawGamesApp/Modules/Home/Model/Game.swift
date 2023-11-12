//
//  Game.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

struct Game: Hashable {
    let id: Int
    let name: String
    let backgroundImage: String
    let metacriticRating: Int
    let genres: [String]
}
