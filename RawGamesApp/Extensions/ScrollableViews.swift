//
//  ScrollableViews.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import UIKit

extension UICollectionView {
    func register(_ cell: AnyClass) {
        self.register(cell, forCellWithReuseIdentifier: String(describing: cell))
    }
    
    func registerHeader(_ header: AnyClass) {
        self.register(header, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: header))
    }
    
    func registerFooter(_ footer: AnyClass) {
        self.register(footer, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: footer))
    }
    
    func dequeue(_ cell: AnyClass, for indexPath: IndexPath) -> UICollectionViewCell? {
        self.dequeueReusableCell(withReuseIdentifier: String(describing: cell), for: indexPath)
    }
    
    func dequeueCell<Cell: UICollectionViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { return Cell() }
        return cell
    }
    
    func dequeueHeader<Header: UICollectionReusableView>(_ header: Header.Type, for indexPath: IndexPath) -> Header {
        guard let header = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: header), for: indexPath) as? Header else { return Header()}
        return header
        
    }
    
    func dequeueFooter<Footer: UICollectionReusableView>(_ footer: Footer.Type, for indexPath: IndexPath) -> Footer {
        guard let footer = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: String(describing: footer), for: indexPath) as? Footer else { return Footer()}
        return footer
    }
}

extension UITableView {
    func register(_ cell: AnyClass) {
        self.register(cell, forCellReuseIdentifier: String(describing: cell))
    }
    
    func registerHeaderFooter(_ header: AnyClass) {
        self.register(header, forHeaderFooterViewReuseIdentifier: String(describing: header))
    }
    
    func dequeue(_ cell: AnyClass, for indexPath: IndexPath) -> UITableViewCell {
        self.dequeueReusableCell(withIdentifier: String(describing: cell), for: indexPath)
    }
    
    func dequeueCell<Cell: UITableViewCell>(_ cell: Cell.Type, for indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath) as? Cell else { return Cell() }
        return cell
    }
 
    func dequeue(_ header: AnyClass) -> UITableViewHeaderFooterView? {
        self.dequeueReusableHeaderFooterView(withIdentifier: String(describing: header))
    }
}
