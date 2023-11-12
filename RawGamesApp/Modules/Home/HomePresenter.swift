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
    private var searchViewModels: [HomeViewModel] = []
    
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
        view?.showLoader()
        interactor.loadData()
    }
    
    func numberOfGames() -> Int {
        interactor.getIsSearch() ? searchViewModels.count : homeViewModels.count
    }
    
    func homeViewModel(at index: Int) -> HomeViewModel {
        interactor.getIsSearch() ? searchViewModels[index] : homeViewModels[index]
    }
    
    func startPaginition(for index: Int) {
        interactor.loadMore(with: index)
    }
    
    func search(with query: String) {
        interactor.search(with: query)
    }
    
    func didSelectUser(at index: Int) {
        let viewModels = interactor.getIsSearch() ? searchViewModels : homeViewModels
        guard let viewModel = viewModels[safe: index] else {
            return // Index out of bounds, handle this scenario appropriately
        }
        
        router.navigateToGameDetails(with: viewModel.id)
    }
    
    // MARK: - Interactor Output
    
    func didFetchGames(with games: [Game]) {
        homeViewModels += games.map { HomeViewModel(game: $0) }
        view?.hideLoader()
        view?.reloadTableView()
    }
    
    func didFetchFailed(error: Error) {
        view?.hideLoader()
        view?.displayError(message: error.localizedDescription)
    }
    
    func showLoadMoreLoading() {
        view?.showLoader()
    }
    
    func didFetchSearch(with games: [Game], isInitial: Bool) {
        if isInitial {
            searchViewModels = games.map { HomeViewModel(game: $0) }
        } else {
            searchViewModels += games.map { HomeViewModel(game: $0) }
        }
        view?.hideLoader()
        view?.reloadTableView()
    }
    
}
