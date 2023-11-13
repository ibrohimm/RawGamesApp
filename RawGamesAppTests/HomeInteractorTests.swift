//
//  HomeInteractorTests.swift
//  RawGamesAppTests
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import XCTest
@testable import RawGamesApp

class HomeInteractorTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Helpers
    
    func makeSUT(client: HTTPClient) -> HomeInteractor {
        let sut = HomeInteractor(client: client)
        return sut
    }
    
}
