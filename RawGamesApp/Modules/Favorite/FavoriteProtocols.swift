//
//  FavoriteProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

// MARK: - View

// MARK: Input
protocol FavoriteViewInput: AnyObject {
    func reloadTableView()
}

// MARK: Output
protocol FavoriteViewOutput: AnyObject {
    func viewWillAppear()
    func numberOfFavoriteGames() -> Int
    func favoriteViewModel(at index: Int) -> FavoriteViewModel
    func didSelectUser(at index: Int)
    
}

// MARK: - Interactor

// MARK: Input
protocol FavoriteInteractorInput: AnyObject {
    func loadData()
}

// MARK: Output
protocol FavoriteInteractorOutput: AnyObject {
    func didFetchFavoritesGames(with games: [FavoritedGame])
}

// MARK: - Router

protocol FavoriteRouterInput: AnyObject {
    func navigateToDetail(with id: Int)
}
