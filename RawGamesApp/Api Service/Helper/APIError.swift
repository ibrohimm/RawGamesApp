//
//  APIError.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 11/11/23.
//

import Foundation

public struct APIError: Error {
    var message: String?
    var code: Int = 0
    
    init(message: String? = "Something is wrong", with code: Int? = 0) {
        self.message = message
        self.code = code ?? 0
    }
    
    init(from error: Error) {
        self.code = error._code
        self.message = error.localizedDescription
    }
}
