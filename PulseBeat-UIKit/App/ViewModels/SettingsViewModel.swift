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
    
    private let userService: UserService
    private let analyticsService: AnalyticsServiceProtocol
    
    weak var delegate: SettingsViewModelDelegate?
    
    init(userService: UserService,
         analyticsService: AnalyticsServiceProtocol
    ) {
        self.userService = userService
        self.analyticsService = analyticsService
    }
    
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
        analyticsService.logEvent("Settings Accessed", parameters: [:])
    }
    
    func logout() {
        delegate?.onLoggedOut()
    }
}
