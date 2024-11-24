//
//  AppCoordinator.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    private let window: UIWindow
    private var mainCoordinator: MainCoordinator?
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let mainCoordinates = MainCoordinator(navigationController: navigationController)
        mainCoordinator = mainCoordinates
        mainCoordinates.start()
        
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
