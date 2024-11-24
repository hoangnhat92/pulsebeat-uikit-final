//
//  FavoriteViewModel.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

class FavoriteViewModel {
    
    private let cacheService = CacheService()
    private let analyticsService = AnalyticsService()
    private let storage = LocalStorage()
    
    private let fileManager = FileManager.default
    private let userDefaults = UserDefaults.standard
    private let bundle = Bundle.main
    
    
    func getFavoriteSongs() -> [String] {
        storage.loadFavoriteSongs()
    }
    
    func logFavoriteAccess() {
        analyticsService.logEvent("Favorite Accessed")
    }
}
