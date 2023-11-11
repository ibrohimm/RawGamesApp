//
//  HTTPClient.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 11/11/23.
//

import Foundation

public protocol HTTPClient {
    typealias Result = Swift.Result<Data, APIError>
    
    /// The completion handler can be invoked in any thread.
    /// Client are responsible to dispatch to appropriate thread, if needed.
    func get(with request: URLRequest, completion: @escaping (Result) -> Void)
}

extension HTTPClient {
    /** Overloaded request - Gets URL and Completion as params  */
    func get(from url: URL, completion: @escaping (HTTPClient.Result) -> Void) {
        get(from: url, method: .GET, completion: completion)
    }

    /** Overloaded request - Gets URL, http method and Completion as params  */
    func get(from url: URL, method: HTTPMethod, completion: @escaping (HTTPClient.Result) -> Void) {
        get(from: url, method: method, headers: nil, body: nil, completion: completion)
    }
    
    /** Overloaded request - Gets URL, http method, headers, body dictionary and Completion as params  */
    func get(from url: URL, method: HTTPMethod, headers: [String: String]?, body: [String: String]? = nil, completion: @escaping (Result) -> Void) {
        let request = buildRequest(from: url, method: method, headers: headers, bodyDictionary: body)
        get(with: request, completion: completion)
    }
}

private extension HTTPClient {
    func buildRequest(from url: URL, method: HTTPMethod = .GET, headers: [String: String]? = nil, bodyDictionary: [String: String]? = nil) -> URLRequest {
        let request = URLRequest.builder(url: url, method: method, headers: headers, bodyMap: bodyDictionary)

         return request
     }
}
