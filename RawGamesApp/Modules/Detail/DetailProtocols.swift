//
//  DetailProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

// MARK: - View

// MARK: Input
protocol DetailViewInput: AnyObject {
    func reloadTableView()
}

// MARK: Output
protocol DetailViewOutput: AnyObject {
    func viewDidLoad()
    func getDetailViewModel() -> DetailViewModel?
}

// MARK: - Interactor

// MARK: Input
protocol DetailInteractorInput: AnyObject {
    func loadDetail()
    
}

// MARK: Output
protocol DetailInteractorOutput: AnyObject {
    func didFetchDetail(with detail: GameDetail)
    func didFetchFailed(error: Error)
}

// MARK: - Router

protocol DetailRouterInput: AnyObject {
}
