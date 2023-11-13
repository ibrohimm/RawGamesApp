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
    func prepareCellViewModel(at index: Int) -> (viewModel: HomeViewModel, isItemOpened: Bool)
    func startPaginition(for: Int)
    func search(with query: String)
    func didSelectUser(at index: Int)
}

// MARK: - Interactor

// MARK: Input
protocol HomeInteractorInput: AnyObject {
    func loadData()
    func loadMore(with index: Int)
    func search(with query: String)
    func getIsSearch() -> Bool
    func markItemAsOpened(_ itemIdentifier: Int)
    func hasOpenedDetail(for itemIdentifier: Int) -> Bool
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
    func navigateToGameDetails(with id: Int)
}
