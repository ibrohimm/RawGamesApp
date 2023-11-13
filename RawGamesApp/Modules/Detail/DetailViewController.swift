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
        tableView.reloadData()
    }
}

// MARK: -
extension DetailViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int { DetailSections.allCases.count }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = presenter?.getDetailViewModel()
        switch indexPath.section {
        case DetailSections.image.rawValue:
            let cell = tableView.dequeueCell(DetailImageCell.self, for: indexPath)
            cell.configure(with: viewModel)
            return cell
            
        case DetailSections.description.rawValue:
            let cell = tableView.dequeueCell(DescriptionCell.self, for: indexPath)
            cell.setTableView(tableView)
            cell.configure(with: viewModel)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if DetailSections.image.rawValue == indexPath.section {
            return tableView.bounds.height * 0.3
        } else {
            return UITableView.automaticDimension
        }
    }
}

// MARK: - UI Setup
extension DetailViewController {
    private func setupUI() {
        view.backgroundColor = .appColor(.primaryBackground)
        createTableView()
        
        let ratingLabel = UILabel()
        ratingLabel.text = "Favorite❤️🩶"
        ratingLabel.textColor = .red
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: ratingLabel)
    }
    
    private func createTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(DetailImageCell.self)
        tableView.register(DescriptionCell.self)
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
