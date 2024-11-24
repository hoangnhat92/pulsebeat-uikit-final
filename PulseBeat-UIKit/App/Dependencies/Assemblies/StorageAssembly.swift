//
//  StorageAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject

class StorageAssembly: Assembly {
    func assemble(container: Container) {
        container.register(LocalStorage.self) { _ in
            LocalStorage()
        }.inObjectScope(.container)
    }
}
