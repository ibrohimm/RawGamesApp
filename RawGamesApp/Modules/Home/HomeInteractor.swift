//
//  HomeInteractor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import Foundation

final class HomeInteractor: HomeInteractorInput {
    
    private weak var presenter: HomeInteractorOutput?
    private var client: HTTPClient?
    private var games: [Game] = []
    private var totalGames = 0
    
    // MARK: - Services
    
    func loadData() {
        let params = [
            "key": KeychainManager.standard.getAPIKey() ?? "",
            "page_size": "\(10)",
            "page": "\(1)"
        ]
        
        var component = URLComponents(url: Endpoint.toURL(.games), resolvingAgainstBaseURL: true)
        component?.setQueryParameters(params)
        guard let url = component?.url else { return }
        
        client?.get(from: url, method: .GET, headers: nil) { [weak self] result in
            switch result {
            case let .success(data):
                do {
                    let mapper = try HomeMapper.map(data)
                    self?.games.append(contentsOf: mapper.list)
                    self?.totalGames = mapper.total
                    self?.presenter?.didFetchGames(with: mapper.list)
                } catch let error {
                    self?.presenter?.didFetchFailed(error: error)
                }
            case let .failure(error):
                self?.presenter?.didFetchFailed(error: error)
            }
        }
    }
    
    // MARK: - Injection
    
    func set(presenter: HomeInteractorOutput, client: HTTPClient) {
        self.presenter = presenter
        self.client = client
    }
    
}
