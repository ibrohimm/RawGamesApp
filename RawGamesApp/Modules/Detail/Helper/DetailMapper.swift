//
//  DetailMapper.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import Foundation

final class DetailMapper {
    
    static func map(_ data: Data) throws -> GameDetail {
        guard let root = try? JSONDecoder().decode(GameDetailModel.self, from: data) else {
            throw APIError()
        }
        
        return root.toModel()
    }
}

private extension GameDetailModel {
    func toModel() -> GameDetail {
        return GameDetail(
            id: id,
            name: name,
            gameDetailModelDescription: gameDetailModelDescription,
            backgroundImage: backgroundImage,
            website: website, reddit: reddit, metacritic: metacritic)
    }
}
