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
        view?.displayGames(with: games)
    }
    
    func didFetchFailed(error: Error) {
        view?.displayError(message: error.localizedDescription)
    }
}
