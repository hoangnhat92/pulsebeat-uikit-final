//
//  AppDelegate.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Create a new UIWindow instance
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        
        let appCoordinator = AppCoordinator(window: window)
        self.appCoordinator = appCoordinator
        appCoordinator.start()
        
        return true
    }
}

