//
//  HomeProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

// MARK: - View

// MARK: Input
protocol HomeViewInput: AnyObject {
    func displayGames(with games: [Game])
    func displayError(message: String)
    
}

// MARK: Output
protocol HomeViewOutput: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor

// MARK: Input
protocol HomeInteractorInput: AnyObject {
    func loadData()
}

// MARK: Output
protocol HomeInteractorOutput: AnyObject {
    func didFetchGames(with games: [Game])
    func didFetchFailed(error: Error)
}

// MARK: - Router

protocol HomeRouterInput: AnyObject {
}
