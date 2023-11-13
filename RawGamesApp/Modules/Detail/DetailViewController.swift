//
//  DetailViewController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import UIKit

final class DetailViewController: UIViewController, DetailViewInput {
    
    private var presenter: DetailViewOutput?
    private let tableView = UITableView(frame: .zero, style: .grouped)
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.viewDidLoad()
    }
    
    // MARK: - Injection
    
    func set(presenter: DetailViewOutput) {
        self.presenter = presenter
    }
    
    // MARK: - View Input
    
    func reloadTableView() {
        
    }
}

// MARK: -
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - UI Setup
extension DetailViewController {
    private func setupUI() {
        view.backgroundColor = .appColor(.primaryBackground)
        createTableView()
        
        let ratingLabel = UILabel()
        ratingLabel.text = "Favorite"
        ratingLabel.textColor = .gray
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ratingLabel)
    }
    
    private func createTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
