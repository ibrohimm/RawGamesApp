//
//  HomeViewController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import UIKit

final class HomeViewController: UIViewController, HomeViewInput {
    
    private var presenter: HomeViewOutput?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Injection
    
    func set(presenter: HomeViewOutput) {
        self.presenter = presenter
    }
    
    // MARK: - View Input
    
    func setup(with viewModel: HomeViewModel) {
        title = "RAWG"
        
    }
}

// MARK: - UI Setup

extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .appColor(.primaryBackground)
        
    }
    
}
