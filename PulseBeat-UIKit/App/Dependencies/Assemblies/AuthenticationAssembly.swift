//
//  AuthenticationAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject

class AuthenticationAssembly: Assembly {
    func assemble(container: Container) {
        container.register(FirebaseService.self) { _ in
            FirebaseService()
        }
    }
}
