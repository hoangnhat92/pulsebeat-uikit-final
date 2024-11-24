//
//  HomeViewModel.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//


class HomeViewModel {
    
    private let analyticsService = AnalyticsService()
    private let adService = AdService()
    
    private(set) var songs = ["Song 1", "Song 2", "Song 3", "Song 4", "Song 5", "Song 6", "Song 7", "Song 8", "Song 9", "Song 10"]
    let storage = LocalStorage()
    
    func favoriteSong(at index: Int) {
        var favorites = storage.loadFavoriteSongs()
        let song = songs[index]
        if !favorites.contains(song) {
            favorites.append(song)
            storage.saveFavoriteSongs(favorites)
        }
    }
    
    func logIntegration() {
        analyticsService.logEvent("Home integration")
    }
    
    func getAd() -> String {
        adService.fetchAd()
    }
}
