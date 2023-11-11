//
//  AlamofireHTTPClient.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 11/11/23.
//

import Foundation
import Alamofire

public final class AlamofireHTTPClient: HTTPClient {
    private let session: Alamofire.Session
    
    public init(session: Alamofire.Session = .default) {
        self.session = session
    }
    
    public func get(with request: URLRequest, completion: @escaping (HTTPClient.Result) -> Void) {
        session.request(request)
            .responseData(completionHandler: { response in
                self.handle(response, completion: completion)
            })
    }
    
    fileprivate func handle(_ response: AFDataResponse<Data>, completion: @escaping (HTTPClient.Result) -> Void) {
        let statusCode = response.response?.statusCode
        if let data = response.data, let statusCode {
            switch statusCode {
            case 200..<300:
                completion(.success(data))
            default:
                let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
                let message = json?["status_message"] as? String
                let error = APIError(message: message, with: statusCode)
                completion(.failure(error))
            }
        } else {
            let message = response.error?.localizedDescription
            let error = APIError(message: message, with: statusCode)
            
            completion(.failure(error))
        }
    }
}
