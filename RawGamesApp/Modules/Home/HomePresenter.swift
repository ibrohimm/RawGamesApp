//
//  HomePresenter.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

final class HomePresenter: HomeViewOutput, HomeInteractorOutput {
    
    private weak var view: HomeViewInput?
    private let interactor: HomeInteractorInput
    private let router: HomeRouterInput
    
    private var homeViewModels: [HomeViewModel] = []
    
    // MARK: - Init
    
    init(view: HomeViewInput,
         interactor: HomeInteractorInput,
         router: HomeRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - View Output
    
    func viewDidLoad() {
        interactor.loadData()
    }
    
    // MARK: - Interactor Output
    
    func didFetchGames(with games: [Game]) {
        homeViewModels = games.map { HomeViewModel(game: $0) }
        view?.reloadTableView()
    }
    
    func didFetchFailed(error: Error) {
        view?.displayError(message: error.localizedDescription)
    }
    
    // MARK: - Helper
    
    func numberOfGames() -> Int { homeViewModels.count }
    
    func homeViewModel(at index: Int) -> HomeViewModel {
        homeViewModels[index]
    }
    
}
