//
//  FavoriteInteractor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

final class FavoriteInteractor: FavoriteInteractorInput {
    
    private weak var presenter: FavoriteInteractorOutput?
    
    // MARK: - Services
    
    // declare API services here
    
    // MARK: - Injection
    
    func set(presenter: FavoriteInteractorOutput) {
        self.presenter = presenter
    }
    
    // MARK: - Interactor Input
    
    func loadData() {
        
    }
}
