//
//  LocalStorage.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import UIKit

class LocalStorage {
    private let favoritesKey = "favoriteSongs"
    
    func saveFavoriteSongs(_ songs: [String]) {
        UserDefaults.standard.set(songs, forKey: favoritesKey)
    }
    
    func loadFavoriteSongs() -> [String] {
        UserDefaults.standard.array(forKey: favoritesKey) as? [String] ?? []
    }
}
