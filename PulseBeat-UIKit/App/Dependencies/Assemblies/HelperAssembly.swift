//
//  HelperAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject
import UIKit

class HelperAssembly: Assembly {
    func assemble(container: Container) {
        container.register(UIApplication.self) { _ in
            UIApplication.shared
        }.inObjectScope(.container)
        
        container.register(UserDefaults.self) { _ in
            UserDefaults.standard
        }.inObjectScope(.container)
        
        container.register(Bundle.self) { _ in
            Bundle.main
        }.inObjectScope(.container)
        
        container.register(FileManager.self) { _ in
            FileManager.default
        }.inObjectScope(.container)
    }
}
