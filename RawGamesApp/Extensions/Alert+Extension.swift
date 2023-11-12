//
//  Alert+Extension.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import UIKit

extension UIViewController {
    
    // MARK: - Alerts
    func showAlert(title: String, action: ((String) -> Void)? = nil) {
        showAlert(title: title, message: nil, closeButtonTitle: "OK", otherButtonTitle: nil, action: action)
    }
    
    func showAlert(with message: String? = nil, action: ((String) -> Void)? = nil) {
        if message != nil {
            showAlert(title: nil, message: message, closeButtonTitle: "OK", otherButtonTitle: nil, action: action)
        }
    }
    
    func showAlert(title: String?, message: String?, closeButtonTitle: String, otherButtonTitle: String?, otherButtonTitle2: String? = nil, action: ((String) -> Void)? = nil) {
        
        let alertController = UIAlertController(title: title ?? "", message: message ?? "", preferredStyle: .alert)
        
        let closeAction = UIAlertAction(title: closeButtonTitle, style: .default, handler: {
            alert -> Void in
            guard let action = action else {return}
            
            action(closeButtonTitle)
        })
        alertController.addAction(closeAction)
        
        if let _ = otherButtonTitle {
            let action = UIAlertAction(title: otherButtonTitle, style: .default, handler: {
                alert -> Void in
                
                guard let action = action else {return}
                
                action(otherButtonTitle!)
            })
            
            alertController.addAction(action)
        }
        if let _ = otherButtonTitle2 {
            let action = UIAlertAction(title: otherButtonTitle2, style: .default, handler: {
                alert -> Void in
                
                guard let action = action else {return}
                
                action(otherButtonTitle2!)
            })
            
            alertController.addAction(action)
        }
        
        DispatchQueue.main.async {
            self.present(alertController, animated: true)
        }
    }
}
