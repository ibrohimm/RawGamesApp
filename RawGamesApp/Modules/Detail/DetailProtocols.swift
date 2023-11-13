//
//  DetailProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

// MARK: - View

// MARK: Input
protocol DetailViewInput: AnyObject {
    func reloadTableView()
    func updateFavoriteState(isFavorited: Bool)
}

// MARK: Output
protocol DetailViewOutput: AnyObject {
    func viewDidLoad()
    func getDetailViewModel() -> DetailViewModel?
    func toggleFavoriteState()
}

// MARK: - Interactor

// MARK: Input
protocol DetailInteractorInput: AnyObject {
    func loadDetail()
    func toggleFavoriteStatus(_ isFavorite: Bool)
}

// MARK: Output
protocol DetailInteractorOutput: AnyObject {
    func didFetchDetail(with detail: GameDetail)
    func didFetchFailed(error: Error)
    func updateFavoriteStatus(_ isFavorite: Bool)
}

// MARK: - Router

protocol DetailRouterInput: AnyObject {
}
