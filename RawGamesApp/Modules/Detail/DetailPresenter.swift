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
        interactor.loadDetail()
    }
    
    func getDetailViewModel() -> DetailViewModel? {
        detailViewModel
    }
    
    // MARK: - Interactor Output
    
    func didFetchDetail(with detail: GameDetail) {
        detailViewModel = DetailViewModel(detail: detail)
        view?.reloadTableView()
    }
    
    func didFetchFailed(error: Error) {
        
    }
}
