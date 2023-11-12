//
//  HomeProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

// MARK: - View

// MARK: Input
protocol HomeViewInput: AnyObject {
    func reloadTableView()
    func displayError(message: String)
    
}

// MARK: Output
protocol HomeViewOutput: AnyObject {
    func viewDidLoad()
    func numberOfGames() -> Int
    func homeViewModel(at index: Int) -> HomeViewModel
    func startPaginition(for: Int)
}

// MARK: - Interactor

// MARK: Input
protocol HomeInteractorInput: AnyObject {
    func loadData()
    func loadMore(with index: Int)
}

// MARK: Output
protocol HomeInteractorOutput: AnyObject {
    func didFetchGames(with games: [Game])
    func didFetchFailed(error: Error)
}

// MARK: - Router

protocol HomeRouterInput: AnyObject {
}
