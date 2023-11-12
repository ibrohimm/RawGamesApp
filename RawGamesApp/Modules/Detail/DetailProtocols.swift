//
//  DetailProtocols.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

// MARK: - View

// MARK: Input
protocol DetailViewInput: AnyObject {
    
}

// MARK: Output
protocol DetailViewOutput: AnyObject {
    func viewDidLoad()
}

// MARK: - Interactor

// MARK: Input
protocol DetailInteractorInput: AnyObject {
    func loadData()
}

// MARK: Output
protocol DetailInteractorOutput: AnyObject {
}

// MARK: - Router

protocol DetailRouterInput: AnyObject {
}
