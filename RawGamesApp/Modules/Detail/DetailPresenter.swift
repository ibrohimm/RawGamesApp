//
//  DetailPresenter.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

final class DetailPresenter: DetailViewOutput, DetailInteractorOutput {
    
    private weak var view: DetailViewInput?
    private let interactor: DetailInteractorInput
    private let router: DetailRouterInput
    
    // MARK: - Init
    
    init(view: DetailViewInput,
         interactor: DetailInteractorInput,
         router: DetailRouterInput) {
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
