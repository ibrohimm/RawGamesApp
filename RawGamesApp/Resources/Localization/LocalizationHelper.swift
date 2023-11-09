//
//  LocalizationHelper.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import Foundation

public extension String {
    /**
     - Returns: The localized string.
     */
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}
