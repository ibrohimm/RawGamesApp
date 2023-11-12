//
//  HomeViewModel.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

struct HomeViewModel {
    let id: Int
    let name: String
    let image: String
    let metacritic: Float
    let rating: String
    let genres: String
    
    init(game: Game) {
        self.id = game.id
        self.name = game.name
        self.image = game.backgroundImage
        self.metacritic = Float(game.metacriticRating)/100
        self.rating = "\(game.metacriticRating)"
        self.genres = game.genres.joined(separator: ", ")
    }
}
