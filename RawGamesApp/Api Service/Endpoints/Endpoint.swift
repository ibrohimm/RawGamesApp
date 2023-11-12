//
//  Endpoint.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

enum Endpoint {
    case games
    
    var rawValue: String {
        switch self {
        case .games:
            return "games"
        }
    }
    
}
