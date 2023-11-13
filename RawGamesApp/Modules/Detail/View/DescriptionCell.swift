//
//  DescriptionCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class DescriptionCell: BaseTableViewCell {
    
    // MARK: - Properties
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    private lazy var readMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(readMoreTapped), for: .touchUpInside)
        return button
    }()
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.setTitle("MORE".localized(), for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var viewModel: DetailViewModel?
    private var isExpanded = false
    private weak var tableView: UITableView?
    
    // MARK: - Helper
    
    func configure(with viewModel: DetailViewModel?) {
        self.viewModel = viewModel
        descriptionLabel.text = viewModel?.description
        moreButton.isHidden = viewModel?.website == nil
        updateReadMoreButton()
    }
    
    func setTableView(_ tableView: UITableView) {
        self.tableView = tableView
    }
    
    // MARK: - Private
    
    private func updateReadMoreButton() {
        readMoreButton.setTitle(isExpanded ? "READ_LESS".localized() : "READ_MORE".localized(), for: .normal)
    }
    
    @objc private func readMoreTapped() {
        isExpanded.toggle()
        descriptionLabel.numberOfLines = isExpanded ? 0 : 4
        updateReadMoreButton()
        
        // Notify the table view to reload the cell
        tableView?.beginUpdates()
        tableView?.endUpdates()
    }
    
    @objc private func moreButtonTapped() {
        if let website = viewModel?.website, let url = URL(string: website) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    override func setupView() {
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(readMoreButton)
        contentView.addSubview(moreButton)
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            readMoreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            readMoreButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            moreButton.topAnchor.constraint(equalTo: readMoreButton.bottomAnchor, constant: 20),
            moreButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 40),
            moreButton.widthAnchor.constraint(equalToConstant: 70),
            moreButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
