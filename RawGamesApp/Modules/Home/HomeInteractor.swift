//
//  HomeInteractor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

final class HomeInteractor: HomeInteractorInput {
    
    private weak var presenter: HomeInteractorOutput?
    
    // MARK: - Services
    
    // declare API services here
    
    // MARK: - Injection
    
    func set(presenter: HomeInteractorOutput) {
        self.presenter = presenter
    }
    
    // MARK: - Interactor Input
    
    func loadData() -> HomeEntity {
        return HomeEntity()
    }
}
