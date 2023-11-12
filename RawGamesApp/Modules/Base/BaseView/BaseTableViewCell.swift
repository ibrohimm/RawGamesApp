//
//  BaseTableViewCell.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    // MARK: - Init
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        selectionStyle = .none
        backgroundColor = .clear
        
        setupView()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .clear
        
        setupView()
    }
    
    // MARK: - Public
    func setupView() {}
}
