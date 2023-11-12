//
//  BaseNavigationController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 10/11/23.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.backgroundColor = .appColor(.primaryBackground)
        navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.white,
                                                  NSAttributedString.Key.backgroundColor:UIColor.clear,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18)
        ]
        
    }
}
