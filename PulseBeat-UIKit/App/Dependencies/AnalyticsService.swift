//
//  AnalyticsService.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//

class AnalyticsService {
    
    func logEvent(_ event: String, parameters: [String: Any] = [:]) {
        print("Log event: \(event) - \(parameters)")
    }
}
