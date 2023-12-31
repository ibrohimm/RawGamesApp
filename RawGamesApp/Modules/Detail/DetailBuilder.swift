//
//  DetailBuilder.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import UIKit

final class DetailBuilder {
    
    func build(withID id: Int) -> UIViewController {
        let client = AlamofireHTTPClient()
        let viewController = DetailViewController()
        let interactor = DetailInteractor(client: client, id: id)
        let router = DetailRouter(viewController: viewController)
        
        let presenter = DetailPresenter(
            view: viewController,
            interactor: interactor,
            router: router
        )
        
        viewController.set(presenter: presenter)
        interactor.set(presenter: presenter)
        
        return viewController
    }
}
