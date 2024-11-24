//
//  FavoriteViewModel.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

class FavoriteViewModel {
    
    private let cacheService: CacheServiceProtocol
    private let analyticsService: AnalyticsServiceProtocol
    private let storage: LocalStorage
    
    private let fileManager: FileManager
    private let userDefaults: UserDefaults
    private let bundle: Bundle
    
    init(cacheService: CacheServiceProtocol,
         analyticsService: AnalyticsServiceProtocol,
         storage: LocalStorage,
         fileManager: FileManager = FileManager.default,
         userDefaults: UserDefaults = UserDefaults.standard,
         bundle: Bundle = Bundle.main
    ) {
        self.cacheService = cacheService
        self.analyticsService = analyticsService
        self.storage = storage
        self.fileManager = fileManager
        self.userDefaults = userDefaults
        self.bundle = bundle
    }
    
    func getFavoriteSongs() -> [String] {
        storage.loadFavoriteSongs()
    }
    
    func logFavoriteAccess() {
        analyticsService.logEvent("Favorite Accessed", parameters: [:])
    }
}
