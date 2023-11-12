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
    func showLoader()
    func hideLoader()
}

// MARK: Output
protocol HomeViewOutput: AnyObject {
    func viewDidLoad()
    func numberOfGames() -> Int
    func homeViewModel(at index: Int) -> HomeViewModel
    func startPaginition(for: Int)
    func search(with query: String)
}

// MARK: - Interactor

// MARK: Input
protocol HomeInteractorInput: AnyObject {
    func loadData()
    func loadMore(with index: Int)
    func search(with query: String)
    func getIsSearch() -> Bool
}

// MARK: Output
protocol HomeInteractorOutput: AnyObject {
    func didFetchGames(with games: [Game])
    func didFetchFailed(error: Error)
    func showLoadMoreLoading()
    func didFetchSearch(with games: [Game], isInitial: Bool)
}

// MARK: - Router

protocol HomeRouterInput: AnyObject {
}
