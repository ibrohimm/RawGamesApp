//
//  FavoriteViewController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class FavoriteViewController: UIViewController, FavoriteViewInput {
    
    private var presenter: FavoriteViewOutput?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Injection
    
    func set(presenter: FavoriteViewOutput) {
        self.presenter = presenter
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        
    }
    
    // MARK: - View Input
    
    
}
