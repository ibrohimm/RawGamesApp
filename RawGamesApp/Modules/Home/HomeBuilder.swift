//
//  HomeBuilder.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import UIKit

final class HomeBuilder {
    
    func build() -> UIViewController {
        let viewController = HomeViewController()
        let router = HomeRouter(viewController: viewController)
        
        let client = AlamofireHTTPClient()
        let interactor = HomeInteractor(client: client)

        let presenter = HomePresenter(
            view: viewController,
            interactor: interactor,
            router: router
        )
        
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        
        return viewController
    }
}
