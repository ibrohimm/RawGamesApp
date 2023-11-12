//
//  APIEnvironment.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

enum APIEnvironment {
    case development
    case staging
    case production
    
    static func baseURL() -> String {
    #if DEBUG
        "https://api.rawg.io/api"
    #else
        "https://api.rawg.io/api"
    #endif
    }
    
}
