//
//  FavoritePresenter.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

final class FavoritePresenter: FavoriteViewOutput, FavoriteInteractorOutput {
    
    private weak var view: FavoriteViewInput?
    private let interactor: FavoriteInteractorInput
    private let router: FavoriteRouterInput
    
    private var favoriteViewModels: [FavoriteViewModel] = []
    
    // MARK: - Init
    
    init(view: FavoriteViewInput,
         interactor: FavoriteInteractorInput,
         router: FavoriteRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - View Output
    
    func viewWillAppear() {
        interactor.loadData()
    }
    
    func numberOfFavoriteGames() -> Int {
        favoriteViewModels.count
    }
    
    func favoriteViewModel(at index: Int) -> FavoriteViewModel {
        favoriteViewModels[index]
    }
    
    func didSelectUser(at index: Int) {
        guard let viewModel = favoriteViewModels[safe: index] else {
            return
        }
        
        router.navigateToDetail(with: viewModel.id)
    }
    
    // MARK: - Interactor Output
    
    func didFetchFavoritesGames(with games: [FavoritedGame]) {
        favoriteViewModels = games.map { FavoriteViewModel(game: $0) }
        view?.reloadTableView()
    }
}
