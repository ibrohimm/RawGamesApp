//
//  HomeViewController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import UIKit

final class HomeViewController: UIViewController, HomeViewInput {
    
    private var presenter: HomeViewOutput?
    private let searchBar = UISearchBar(frame: .zero)
    
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

// MARK: -
extension HomeViewController: UISearchBarDelegate, UIScrollViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}

// MARK: - UI Setup

extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .appColor(.primaryBackground)
        createSearchView()
        
    }
    
    private func createSearchView() {
        searchBar.delegate = self
        searchBar.setCustomSetting()
        
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            searchBar.heightAnchor.constraint(equalToConstant: 33)
        ])
    }
    
}
