//
//  HomeViewModel.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//


class HomeViewModel {
    
    private let analyticsService: AnalyticsServiceProtocol
    private let adService: AdServiceProtocol
    private let networkingService: NetworkingServiceProtocol
    
    init(networkingService: NetworkingServiceProtocol,
         analyticsService: AnalyticsServiceProtocol,
         adService: AdServiceProtocol) {
        self.networkingService = networkingService
        self.analyticsService = analyticsService
        self.adService = adService
    }
    
    private(set) var songs: [String] = []
    let storage = LocalStorage()
    
    var onSongsUpdated: (() -> Void)?
    
    func fetchLatestSongs() {
        networkingService.fetchLatestSongs { [weak self] result in
            switch result {
            case .success(let songs):
                self?.songs = songs
                self?.onSongsUpdated?()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func favoriteSong(at index: Int) {
        var favorites = storage.loadFavoriteSongs()
        let song = songs[index]
        if !favorites.contains(song) {
            favorites.append(song)
            storage.saveFavoriteSongs(favorites)
        }
    }
    
    func logIntegration() {
        analyticsService.logEvent("Home integration", parameters: [:])
    }
    
    func getAd() -> String {
        adService.fetchAd()
    }
}
