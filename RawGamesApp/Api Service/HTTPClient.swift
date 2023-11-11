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
