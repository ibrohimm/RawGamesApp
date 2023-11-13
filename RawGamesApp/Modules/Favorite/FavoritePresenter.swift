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
    
    // MARK: - Init
    
    init(view: FavoriteViewInput,
         interactor: FavoriteInteractorInput,
         router: FavoriteRouterInput) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - View Output
    
    func viewDidLoad() {
        interactor.loadData()
    }
    
    // MARK: - View Model
    
    
}
