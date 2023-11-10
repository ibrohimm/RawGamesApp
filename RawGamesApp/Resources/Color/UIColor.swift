//
//  UIColor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 10/11/23.
//

import UIKit

extension UIColor {
    static func appColor(_ name: AssetColors) -> UIColor {
        return UIColor(named: name.rawValue) ?? .clear
    }
}
