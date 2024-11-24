//
//  CacheService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Foundation

class CacheService {
    private var cache: [String: Data] = [:]
    
    func get(_ key: String) -> Data? {
        cache[key]
    }
    
    func set(_ key: String, _ value: Data) {
        cache[key] = value
    }
}
