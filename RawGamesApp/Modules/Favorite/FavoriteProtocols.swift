//
//  FavoriteProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

// MARK: - View

// MARK: Input
protocol FavoriteViewInput: AnyObject {
    
}

// MARK: Output
protocol FavoriteViewOutput: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor

// MARK: Input
protocol FavoriteInteractorInput: AnyObject {
    func loadData()
}

// MARK: Output
protocol FavoriteInteractorOutput: AnyObject {
}

// MARK: - Router

protocol FavoriteRouterInput: AnyObject {
}
