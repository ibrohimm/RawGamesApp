//
//  FavoriteRouter.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class FavoriteRouter: FavoriteRouterInput {
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    // MARK: - Router Input
    
    func navigateToDetail(with id: Int) {
        let detailModule = DetailBuilder().build(withID: id)
        detailModule.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(detailModule, animated: true)
    }
}
