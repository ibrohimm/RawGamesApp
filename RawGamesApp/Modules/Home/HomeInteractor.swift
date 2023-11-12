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
    private var nextPageURL: String?
    private var isFetchInProgress = false
    
    // MARK: - Services
    
    func loadData() {
        let params = [
            "key": KeychainManager.standard.getAPIKey() ?? "",
            "page_size": "\(20)",
            "page": "\(1)"
        ]
        
        var component = URLComponents(url: Endpoint.toURL(.games), resolvingAgainstBaseURL: true)
        component?.setQueryParameters(params)
        
        guard var url = component?.url else { return }
        if let nextPageURL, let nextURL = URL(string: nextPageURL) {
            url = nextURL
        }
        
        client?.get(from: url, method: .GET, headers: nil) { [weak self] result in
            self?.isFetchInProgress = false
            switch result {
            case let .success(data):
                do {
                    let mapper = try HomeMapper.map(data)
                    self?.games.append(contentsOf: mapper.list)
                    self?.nextPageURL = mapper.nextPage
                    self?.presenter?.didFetchGames(with: mapper.list)
                } catch let error {
                    self?.presenter?.didFetchFailed(error: error)
                }
            case let .failure(error):
                self?.presenter?.didFetchFailed(error: error)
            }
        }
    }
    
    func loadMore(with index: Int) {
        if index == getGamesList().count - 3 && nextPageURL != nil {
            guard !isFetchInProgress else { return }
            isFetchInProgress = true
            presenter?.showLoadMoreLoading()
            loadData()
        }
    }
    
    // MARK: - Injection
    
    func set(presenter: HomeInteractorOutput, client: HTTPClient) {
        self.presenter = presenter
        self.client = client
    }
    
    // MARK: - Helper
    
    func getGamesList() -> [Game] {
        return games
    }
}
