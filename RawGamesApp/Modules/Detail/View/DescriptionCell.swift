//
//  DescriptionCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class DescriptionCell: BaseTableViewCell {
    
    // MARK: - Properties
    let decriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    override func setupView() {
        contentView.addSubview(decriptionLabel)
        
        NSLayoutConstraint.activate([
            decriptionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            decriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            decriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            decriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

