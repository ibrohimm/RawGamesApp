//
//  FavoriteViewController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class FavoriteViewController: UIViewController, FavoriteViewInput {
    
    private var presenter: FavoriteViewOutput?
    private let tableView = UITableView(frame: .zero, style: .plain)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.viewWillAppear()
    }
    
    // MARK: - Injection
    
    func set(presenter: FavoriteViewOutput) {
        self.presenter = presenter
    }
    
    // MARK: - View Input
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfFavoriteGames() == 0 ? 1 :  (presenter?.numberOfFavoriteGames() ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if presenter?.numberOfFavoriteGames() == 0 {
            let cell = tableView.dequeueCell(EmptyStateTableCell.self, for: indexPath)
            return cell
        } else {
            let cell = tableView.dequeueCell(FavoriteGameTableCell.self, for: indexPath)
            if let viewModel = presenter?.favoriteViewModel(at: indexPath.row) {
                cell.configure(with: viewModel)
            }
            return cell
        }
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectUser(at: indexPath.row)
    }
}

// MARK: - UI Setup
extension FavoriteViewController {
    private func setupUI() {
        view.backgroundColor = .appColor(.primaryBackground)
        createTableView()
    }
    
    private func createTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.layer.cornerRadius = 12
        tableView.layer.masksToBounds = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FavoriteGameTableCell.self)
        tableView.register(EmptyStateTableCell.self)
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
