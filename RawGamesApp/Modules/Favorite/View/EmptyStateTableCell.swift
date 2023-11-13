//
//  EmptyStateTableCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class EmptyStateTableCell: BaseTableViewCell {
    
    private let messageLabel: UILabel = {
        let label = UILabel()
        label.text = "No items to display."
        label.textColor = .gray
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    // MARK: - Private
    
    override func setupView() {
        backgroundColor = .clear
        addSubview(messageLabel)
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
