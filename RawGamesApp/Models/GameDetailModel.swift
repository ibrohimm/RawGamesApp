//
//  GameDetailModel.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

struct GameDetailModel: Codable {
    let id: Int
    let name, gameDetailModelDescription: String
    let backgroundImage: String?
    let added: Int
    let rating: Double
    let ratingTop: Int?
    let released: String?
    let reviewsCount: Int
    let website: String?
    let reddit: String?
    let metacritic: Int?
    
    enum CodingKeys: String, CodingKey {
        case id, name, released, website, added, rating, metacritic
        case gameDetailModelDescription = "description_raw"
        case backgroundImage = "background_image"
        case ratingTop = "rating_top"
        case reviewsCount = "reviews_count"
        case reddit = "reddit_url"
    }
}
