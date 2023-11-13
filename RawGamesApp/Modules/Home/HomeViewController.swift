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
    private let tableView = UITableView(frame: .zero, style: .plain)
    private var paginationIndicator = UIActivityIndicatorView(style: .white)
    
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
    
    func reloadTableView() {
        tableView.reloadData()
    }
    
    func displayError(message: String) {
        showAlert(with: message)
    }
    
    func showLoader() {
        paginationIndicator.startAnimating()
    }
    
    func hideLoader() {
        paginationIndicator.stopAnimating()
    }
}

extension HomeViewController: UISearchBarDelegate, UIScrollViewDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.search(with: searchText)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.search(with: searchBar.text ?? "")
        hideSearchKeyboard()
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if scrollView == tableView { hideSearchKeyboard() }
    }
    
    fileprivate func hideSearchKeyboard() {
        searchBar.resignFirstResponder()
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfGames() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(GameTableViewCell.self, for: indexPath)
        if let viewModel = presenter?.homeViewModel(at: indexPath.row) {    cell.configure(with: viewModel)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        presenter?.startPaginition(for: indexPath.row)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectUser(at: indexPath.row)
    }
}

// MARK: - UI Setup
extension HomeViewController {
    private func setupUI() {
        view.backgroundColor = .appColor(.primaryBackground)
        createSearchView()
        createTableView()
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
    
    private func createTableView() {
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .singleLine
        tableView.rowHeight = 100
        tableView.layer.cornerRadius = 12
        tableView.layer.masksToBounds = true
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.tableFooterView = createFooterView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(GameTableViewCell.self)
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    fileprivate func createFooterView() -> UIView {
        lazy var footer = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 50))
        footer.backgroundColor = .clear
        
        paginationIndicator.color = .gray
        paginationIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        footer.addSubview(paginationIndicator)
        NSLayoutConstraint.activate([
            paginationIndicator.centerYAnchor.constraint(equalTo: footer.centerYAnchor),
            paginationIndicator.centerXAnchor.constraint(equalTo: footer.centerXAnchor),
            paginationIndicator.widthAnchor.constraint(equalToConstant: 40),
            paginationIndicator.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        return footer
    }
}
