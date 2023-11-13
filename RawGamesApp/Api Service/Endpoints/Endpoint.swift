//
//  Endpoint.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

enum Endpoint {
    case games
    case detail(id: Int)
    
    var rawValue: String {
        switch self {
        case .games:
            return "games"
        case .detail(id: let id):
            return "games/\(id)"
        }
    }
    
}
