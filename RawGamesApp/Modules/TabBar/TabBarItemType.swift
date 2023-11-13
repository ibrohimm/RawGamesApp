//
//  TabBarItemType.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import UIKit

enum TabBarItemType: Int {
    case unknown        = -1
    case home           = 0
    case favorite       = 1
    
    var name: String {
        let new: String
        switch self {
        case .home:
            new = "HOME"
        case .favorite:
            new = "FAVORITES"
        case .unknown:
            new = "Unknown"
        }
        return new
    }
    
    var icon: String {
        let new: String
        switch self {
        case .home:
            new = "ic_home"
        case .favorite:
            new = "ic_favorite"
        case .unknown:
            new = ""
        }
        return new
    }
}

final class TabBarItem: UITabBarItem {
    var tabItemType: TabBarItemType = .unknown
}
