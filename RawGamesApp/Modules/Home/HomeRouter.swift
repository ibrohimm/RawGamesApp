//
//  HomeRouter.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import UIKit

final class HomeRouter: HomeRouterInput {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Router Input
    
    func navigateToGameDetails(with id: Int) {
        
    }
}
