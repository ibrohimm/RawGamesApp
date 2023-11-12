//
//  DetailInteractor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

final class DetailInteractor: DetailInteractorInput {
    
    private weak var presenter: DetailInteractorOutput?
    
    // MARK: - Services
    
    func loadData() {
        
    }
    
    // MARK: - Injection
    
    func set(presenter: DetailInteractorOutput) {
        self.presenter = presenter
    }
    
    // MARK: - Interactor Input
    
}
