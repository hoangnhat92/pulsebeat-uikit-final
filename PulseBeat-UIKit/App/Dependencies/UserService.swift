//
//  UserService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//

class UserService {
    
    private let networkingService: NetworkingServiceProtocol
    
    init(networkingService: NetworkingServiceProtocol) {
        self.networkingService = networkingService
    }
    
    func getUserSettings() -> [String: Any]{
        return [
            "theme": "dark",
            "notificationsEnabled": true
        ]
    }
}
