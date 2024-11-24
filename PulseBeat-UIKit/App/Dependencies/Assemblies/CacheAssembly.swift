//
//  CacheAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject

class CacheAssembly: Assembly {
    func assemble(container: Container) {
        container.register(CacheServiceProtocol.self) { _ in
            CacheService()
        }.inObjectScope(.container)
    }
}
