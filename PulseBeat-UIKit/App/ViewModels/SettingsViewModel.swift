//
//  SettingsViewModel.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

protocol SettingsViewModelDelegate: AnyObject {
    func onLoggedOut()
}

class SettingsViewModel {
    
    private let userService = UserService()
    private let analyticsService = AnalyticsService()
    
    weak var delegate: SettingsViewModelDelegate?
    
    var sections: [[String]] {
        return [
            ["Account", "Notifications"],
            ["Privacy Policy", "Terms of Service"]
        ]
    }
    
    func setting(at indexPath: IndexPath) -> String {
        return sections[indexPath.section][indexPath.row]
    }
    
    func logSettingsAccess() {
        analyticsService.logEvent("Settings Accessed")
    }
    
    func logout() {
        delegate?.onLoggedOut()
    }
}
