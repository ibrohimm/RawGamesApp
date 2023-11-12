//
//  DetailViewController.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import UIKit

final class DetailViewController: UIViewController, DetailViewInput {
    
    private var presenter: DetailViewOutput?
    
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
    
    // MARK: - UI Setup
    
    private func setupUI() {
    }
    
    // MARK: - View Input
    
}
