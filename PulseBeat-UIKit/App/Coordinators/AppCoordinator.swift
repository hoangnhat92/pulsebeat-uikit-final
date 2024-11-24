//
//  AppCoordinator.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit
import Swinject

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private let window: UIWindow
    private var mainCoordinator: MainCoordinator?
    private let container: Container
    
    init(window: UIWindow, container: Container = .init()) {
        self.window = window
        self.container = container
        self.navigationController = UINavigationController()
    }
    
    func start() {
        //
        let assemblies: [Assembly] = [
            NetworkingAssembly(),
            AnalyticsAssembly(),
            AdAssembly(),
            AuthenticationAssembly(),
            CacheAssembly(),
            HelperAssembly(),
            StorageAssembly(),
        ]
        assemblies.forEach { $0.assemble(container: container) }

        let mainCoordinates = MainCoordinator(
            navigationController: navigationController,
            container: container
        )
        mainCoordinator = mainCoordinates
        mainCoordinates.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
