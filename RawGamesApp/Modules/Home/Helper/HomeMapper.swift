//
//  HomeMapper.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

final class HomeMapper {
    
    static func map(_ data: Data) throws -> (list: [Game], total: Int) {
        guard let root = try? JSONDecoder().decode(GameModel.self, from: data) else {
            throw APIError()
        }
        
        return (root.results.toModels(), root.count)
    }
}

private extension Array where Element == ResultGameModel {
    func toModels() -> [Game] {
        return map { Game(
            id: $0.id,
            name: $0.name,
            backgroundImage: $0.backgroundImage ?? "",
            metacriticRating: $0.metacriticRating ?? 0,
            genres: $0.genres.map(\.name))
        }
    }
}
