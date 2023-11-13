//
//  HomeInteractor.swift
//  RawGamesApp
//
//  Created by Ibrokhim Movlonov on 09/11/23.
//

import Foundation

final class HomeInteractor: HomeInteractorInput {
    
    private weak var presenter: HomeInteractorOutput?
    private let client: HTTPClient
    
    private var games: [Game] = []
    private var nextPageURL: String?
    private var searchGames: [Game] = []
    private var searchNextPageURL: String?
    
    private var isFetchInProgress = false
    private var task: DispatchWorkItem?
    private var searchTimer: Timer?
    private var isSearch = false
    private var searchedText: String = ""

    // MARK: - Init
    
    init(client: HTTPClient) {
        self.client = client
    }
    
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
        
        client.get(from: url, method: .GET, headers: nil) { [weak self] result in
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
            self?.isFetchInProgress = false
        }
    }
    
    func loadMore(with index: Int) {
        if index == getGamesList().count - 3 && nextPageURL != nil {
            guard !isFetchInProgress else { return }
            isFetchInProgress = true
            presenter?.showLoadMoreLoading()
            isSearch ? loadSearch(query: searchedText, isInitial: false) : loadData()
        }
    }
    
    func search(with query: String) {
        isSearch = true
        if query.count == 0 {
            makeEmptyList()
        } else {
            searchedText = query
            searchTimer?.invalidate()
            
            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false, block: { timer in
                self.task?.cancel()
                self.task = nil
                
                self.task = DispatchWorkItem
                { [weak self] in guard let self = self, let item = self.task, !item.isCancelled else { return }
                    self.searchNextPageURL = nil
                    self.loadSearch(query: query, isInitial: true)
                }
                self.task?.perform()
            })
        }
    }
    
    private func loadSearch(query: String, isInitial: Bool) {
        let params = [
            "key": KeychainManager.standard.getAPIKey() ?? "",
            "page_size": "\(20)",
            "page": "\(1)",
            "search": query
        ]
        
        var component = URLComponents(url: Endpoint.toURL(.games), resolvingAgainstBaseURL: true)
        component?.setQueryParameters(params)
        
        guard var url = component?.url else { return }
        if let searchNextPageURL, let nextURL = URL(string: searchNextPageURL) {
            url = nextURL
        }
        
        client.get(from: url, method: .GET, headers: nil) { [weak self] result in
            switch result {
            case let .success(data):
                do {
                    let mapper = try HomeMapper.map(data)
                    if !isInitial {
                        self?.searchGames.append(contentsOf: mapper.list)
                    } else {
                        self?.searchGames = mapper.list
                    }
                    self?.searchNextPageURL = mapper.nextPage
                    self?.presenter?.didFetchSearch(with: mapper.list, isInitial: isInitial)

                } catch let error {
                    self?.presenter?.didFetchFailed(error: error)
                }
            case let .failure(error):
                self?.presenter?.didFetchFailed(error: error)
            }
            self?.isFetchInProgress = false
        }
    }
    
    // MARK: - Injection
    
    func set(presenter: HomeInteractorOutput) {
        self.presenter = presenter
    }
    
    // MARK: - Helper
    
    private func getGamesList() -> [Game] {
        return isSearch ? searchGames : games
    }
    
    private func makeEmptyList() {
        searchedText = ""
        isSearch = false
        searchGames = []
        searchNextPageURL = nil
        presenter?.didFetchSearch(with: [], isInitial: true)
    }
    
    func getIsSearch() -> Bool { isSearch }
}
