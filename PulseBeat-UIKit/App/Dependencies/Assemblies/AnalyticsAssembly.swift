//
//  AnalyticsAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject

class AnalyticsAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AnalyticsServiceProtocol.self) { _ in
            AnalyticsService()
        }.inObjectScope(.container)
    }
}
