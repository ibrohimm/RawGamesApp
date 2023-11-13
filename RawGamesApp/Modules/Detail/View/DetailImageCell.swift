//
//  DetailImageCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class DetailImageCell: BaseTableViewCell {
    
    // MARK: - Properties
    private let gameImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        
        return image
    }()
    
    // MARK: - Helper
    func configure(with viewModel: DetailViewModel?) {
        gameImage.setImage(with: viewModel?.image)
    }
    
    override func setupView() {
        contentView.addSubview(gameImage)
        
        NSLayoutConstraint.activate([
            gameImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            gameImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            gameImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            gameImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor)
        ])
    }
}
