//
//  TabBarController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
        setupControllers()
    }
    
    // MARK: - Private
    private func setupControllers() {
        let homeCtr = getControllerAt(type: .home)
        let favoriteCtr = getControllerAt(type: .favorite)
        
        setViewControllers([homeCtr, favoriteCtr], animated: false)
        tabBar.backgroundColor = .appColor(.primaryBackground)
    }
    
    private func getControllerAt(type: TabBarItemType) -> UIViewController {
        switch type {
        case .home:
            let home = HomeBuilder().build()
            home.title = "RAW_GAMES".localized()
            return createTabBarItem(ctr: home, type: type)
            
        case .favorite:
            let favorite = UIViewController()
            return createTabBarItem(ctr: favorite, type: type)
            
        case .unknown:
            return UIViewController()
        }
    }
    
    private func createTabBarItem(ctr: UIViewController, type: TabBarItemType) -> UINavigationController {
        let customTab = TabBarItem(
            title: type.name.localized(),
            image: UIImage(named: type.icon),
            selectedImage: UIImage(named: type.icon))
        customTab.tabItemType = type
        customTab.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 10)], for: .normal)
        
        let nv = BaseNavigationController(rootViewController: ctr)
        nv.tabBarItem = customTab
        
        return nv
    }

}
