//
//  FavoriteGameTableCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 13/11/23.
//

import UIKit

final class FavoriteGameTableCell: BaseTableViewCell {
    
    // MARK: - Properties
    private let image: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        
        return image
    }()
    private let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        
        return label
    }()
    private let genres: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .gray
        
        return label
    }()
    fileprivate lazy var progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.progress = 0
        progressView.layer.cornerRadius = progressView.bounds.size.height/2
        progressView.clipsToBounds = true
        progressView.trackTintColor = .gray
        progressView.progressTintColor = .orange
        
        return progressView
    }()
    private let progressLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .gray
        
        return label
    }()
    
    // MARK: - Helper
    func configure(with viewModel: FavoriteViewModel) {
        title.text = viewModel.name
        progressView.progress = viewModel.metacritic ?? 0
        progressLabel.text = viewModel.rating
        image.setImage(with: viewModel.image)
    }
    
    override func setupView() {
        backgroundColor = .appColor(.customLightGray)
        accessoryType = .disclosureIndicator
        separatorInset = .zero
        
        let progressStackView = UIStackView(arrangedSubviews: [progressView, progressLabel])
        progressStackView.spacing = 6
        progressStackView.alignment = .center
        
        let stackView = UIStackView(arrangedSubviews: [title, genres, progressStackView])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(image)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.widthAnchor.constraint(equalToConstant: 70),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            stackView.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -6)
        ])
    }
}
