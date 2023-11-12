//
//  GameModel.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

struct GameModel: Codable {
    let results: [ResultGameModel]
    let count: Int
}

struct ResultGameModel: Codable {
    let id: Int
    let name: String
    let backgroundImage: String?
    let metacriticRating: Int?
    let genres: [GenreModel]
    
    enum CodingKeys: String, CodingKey {
        case id, name, genres
        case backgroundImage = "background_image"
        case metacriticRating = "metacritic"
    }
}

struct GenreModel: Codable {
    let id: Int
    let name, slug: String
    let gamesCount: Int?
    let imageBackground: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case gamesCount = "games_count"
        case imageBackground = "image_background"
    }
}
