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
        let entity = interactor.loadData()
        let viewModel = makeViewModel(for: entity)
        view?.setup(with: viewModel)
    }
    
    // MARK: - View Model
    
    private func makeViewModel(for entity: HomeEntity) -> HomeViewModel {
        return HomeViewModel()
    }
}
