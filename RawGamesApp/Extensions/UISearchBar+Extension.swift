//
//  UISearchBar+Extension.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 10/11/23.
//

import UIKit

extension UISearchBar {
    
    func setCustomSetting() {
        backgroundColor = .appColor(.customLightGray).withAlphaComponent(0.3)
        backgroundImage = UIImage()
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 13.0, *) {
            searchTextField.textColor = .appColor(.searchPlaceholder)
            searchTextField.backgroundColor = .clear
            
            searchTextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIColor.appColor(.searchPlaceholder)])
            searchTextField.leftView = UIImageView(image: UIImage(systemName: "magnifyingglass")?.withTintColor(UIColor.appColor(.searchPlaceholder), renderingMode: .alwaysOriginal))
        } else {
            // Fallback on earlier versions
            if let textField = value(forKey: "searchField") as? UITextField {
                textField.backgroundColor = .clear
                textField.textColor = .appColor(.searchPlaceholder)
            }
        }
    }
}
