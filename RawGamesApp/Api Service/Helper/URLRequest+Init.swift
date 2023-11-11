//
//  URLRequest+Init.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 11/11/23.
//

import Foundation

extension URLRequest {
    
    init(url: URL, method: HTTPMethod, headers: [String: String]?, body: [String: String]?) {
        self.init(url: url)
        httpMethod = method.rawValue
        
        httpBody = body?.asString(joined: "&").data(using: .utf8)
        allHTTPHeaderFields = headers
    }
    
}

private extension Dictionary {
    func asString(joined symbol: String) -> String {
        return (compactMap { "\($0)=\($1)" } as Array).joined(separator: symbol)
    }
}

extension URLRequest {
    static func builder(url: URL, method: HTTPMethod, headers: [String: String]?, bodyMap: [String: String]?) -> URLRequest {
         return URLRequest(url: url, method: method, headers: headers, body: bodyMap)
     }
}
