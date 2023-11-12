//
//  Endpoint+toURL.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

extension Endpoint {
    
    static func toURL(_ endPoint: Endpoint) -> URL {
        let baseURL = APIEnvironment.baseURL()
        
        return URL(string: baseURL + "/" + endPoint.rawValue)!
    }
    
}
