//
//  FavoriteViewModel.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import Foundation

struct FavoriteViewModel {
    let id: Int
    let name: String
    let description: String
    let image: String?
    let website: String?
    let metacritic: Float?
    let rating: String?
    
    init(game: FavoritedGame) {
        self.id = game.id
        self.name = game.name
        self.image = game.image
        self.description = game.description
        self.website = game.website
        if let metacri = game.metacritic {
            self.metacritic = Float(metacri)/100
            self.rating = "\(metacri)"
        } else {
            self.metacritic = nil
            self.rating = nil
        }
    }
}
