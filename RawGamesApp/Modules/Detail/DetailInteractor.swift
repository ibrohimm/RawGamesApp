//
//  DetailInteractor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 12/11/23.
//

import Foundation

final class DetailInteractor: DetailInteractorInput {
    
    private weak var presenter: DetailInteractorOutput?
    private let client: HTTPClient
    private let detailID: Int
    
    private var gameDetail: GameDetail? {
        didSet {
            presenter?.updateFavoriteStatus(isGameFavorited(id: detailID))
        }
    }
    
    // MARK: - Init
    init(client: HTTPClient, id: Int) {
        self.client = client
        self.detailID = id
    }
    
    // MARK: - Services
    
    func loadDetail() {
        let params = [ "key": KeychainManager.standard.getAPIKey() ?? ""]
        
        var component = URLComponents(url: Endpoint.toURL(.detail(id: detailID)), resolvingAgainstBaseURL: true)
        component?.setQueryParameters(params)
        guard let url = component?.url else { return }
        
        client.get(from: url, method: .GET, headers: nil) { [weak self] result in
            switch result {
            case let .success(data):
                do {
                    let mapper = try DetailMapper.map(data)
                    self?.gameDetail = mapper
                    self?.presenter?.didFetchDetail(with: mapper)
                } catch let error {
                    self?.presenter?.didFetchFailed(error: error)
                }
            case let .failure(error):
                self?.presenter?.didFetchFailed(error: error)
            }
        }
    }
    
    // MARK: - Injection
    
    func set(presenter: DetailInteractorOutput) {
        self.presenter = presenter
    }
    
    // MARK: - Helper
    
    func toggleFavoriteStatus(_ isFavorite: Bool) {
        if isFavorite {
            CoreDataManager.shared.removeFavoriteGame(id: detailID)
        } else {
            CoreDataManager.shared.addFavoriteGame(gameDetail: gameDetail!)
        }
        presenter?.updateFavoriteStatus(!isFavorite)
    }
    
    private func isGameFavorited(id: Int) -> Bool {
        CoreDataManager.shared.isGameFavorited(id: id)
    }
}
