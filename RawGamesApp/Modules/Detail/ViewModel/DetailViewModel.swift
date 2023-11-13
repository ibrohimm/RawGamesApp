//
//  DetailViewModel.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import Foundation

struct DetailViewModel {
    let name: String
    let image: String?
    let description: String
    let website: String?
    
    init(detail: GameDetail) {
        self.name = detail.name
        self.image = detail.backgroundImage
        self.description = detail.gameDetailModelDescription
        self.website = detail.website
    }
}
