//
//  HomeProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

// MARK: - View

// MARK: Input
protocol HomeViewInput: AnyObject {
    func setup(with viewModel: HomeViewModel)
}

// MARK: Output
protocol HomeViewOutput: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor

// MARK: Input
protocol HomeInteractorInput: AnyObject {
    func loadData() -> HomeEntity
}

// MARK: Output
protocol HomeInteractorOutput: AnyObject {
}

// MARK: - Router

protocol HomeRouterInput: AnyObject {
}
