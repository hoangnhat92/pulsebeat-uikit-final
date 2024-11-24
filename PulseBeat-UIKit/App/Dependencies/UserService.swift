//
//  UserService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//

class UserService {
    
    let networkingService = NetworkingService()    
    
    func getUserSettings() -> [String: Any]{
        return [
            "theme": "dark",
            "notificationsEnabled": true
        ]
    }
}
