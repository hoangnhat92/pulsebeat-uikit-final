//
//  NetworkingAssembly.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 24/11/24.
//
import Swinject

class NetworkingAssembly: Assembly {
    func assemble(container: Container) {
        container.register(NetworkingServiceProtocol.self) { _ in
            NetworkingService()
        }
        container.register(UserService.self) { r in
            UserService(networkingService: r.resolve(NetworkingServiceProtocol.self)!)
        }
    }
}
