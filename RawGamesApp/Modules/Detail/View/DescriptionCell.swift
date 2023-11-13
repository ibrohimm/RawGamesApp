//
//  DescriptionCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class DescriptionCell: BaseTableViewCell {
    
    // MARK: - Properties
    private let decriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .gray
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    // MARK: - Helper
    
    func configure(with viewModel: DetailViewModel?) {
        decriptionLabel.text = viewModel?.description
    }
    
    // MARK: - Private
    
    override func setupView() {
        contentView.addSubview(decriptionLabel)
        
        NSLayoutConstraint.activate([
            decriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor,  constant: 0),
            decriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            decriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            decriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,  constant: -16)
        ])
    }
}

