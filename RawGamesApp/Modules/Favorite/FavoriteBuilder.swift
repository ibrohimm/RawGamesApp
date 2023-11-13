//
//  FavoriteBuilder.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class FavoriteBuilder {
    
    func build() -> UIViewController {
        let viewController = FavoriteViewController()
        let interactor = FavoriteInteractor()
        let router = FavoriteRouter(viewController: viewController)
        
        let presenter = FavoritePresenter(
            view: viewController,
            interactor: interactor,
            router: router
        )
        
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        
        return viewController
    }
}
