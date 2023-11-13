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
    
    private var detailViewModel: DetailViewModel?
    private var isFavorite: Bool = false
    
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
        view?.displayLoading()
        interactor.loadDetail()
    }
    
    func getDetailViewModel() -> DetailViewModel? {
        detailViewModel
    }
    
    func toggleFavoriteState() {
        interactor.toggleFavoriteStatus(isFavorite)
    }
    
    // MARK: - Interactor Output
    
    func didFetchDetail(with detail: GameDetail) {
        detailViewModel = DetailViewModel(detail: detail)
        view?.hideLoader()
        view?.reloadTableView()
    }
    
    func didFetchFailed(error: Error) {
        view?.hideLoader()
        view?.displayError(message: error.localizedDescription)
    }
    
    func updateFavoriteStatus(_ isFavorite: Bool) {
        self.isFavorite = isFavorite
        view?.updateFavoriteState(isFavorited: isFavorite)
    }
}
