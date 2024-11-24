//
//  AdService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
protocol AdServiceProtocol {
    func fetchAd() -> String
}

class AdService: AdServiceProtocol {
    func fetchAd() -> String {
        return "Ad Content"
    }
}
