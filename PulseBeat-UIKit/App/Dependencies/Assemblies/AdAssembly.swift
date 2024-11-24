//
//  AdAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject

class AdAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AdServiceProtocol.self) { _ in
            AdService()
        }.inObjectScope(.container)
    }
}
