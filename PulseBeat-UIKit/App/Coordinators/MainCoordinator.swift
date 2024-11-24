//
//  MainCoordinator.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit
import Swinject

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    private let container: Container
    
    init(navigationController: UINavigationController, container: Container) {
        self.navigationController = navigationController
        self.container = container
    }
    
    func start() {
        showLoginScreen()
    }
    
    private func showLoginScreen() {
        let networkingService = container.resolve(NetworkingServiceProtocol.self)!
        let firebaseService = container.resolve(FirebaseService.self)!
        let analyticsService = container.resolve(AnalyticsServiceProtocol.self)!
        
        let loginViewModel = LoginViewModel(
            networkingService: networkingService,
            firebaseService: firebaseService,
            analyticsService: analyticsService
        )
        
        let loginVC = LoginViewController(viewModel: loginViewModel)
        loginVC.onLoginCompletion = { [weak self] result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self?.showHomeScreen()
                }
            case .failure(let error):
                print("Login failed: \(error.localizedDescription)")
            }
        }
        navigationController.setViewControllers([loginVC], animated: false)
    }
    
    private func showHomeScreen() {
        let networkingService = container.resolve(NetworkingServiceProtocol.self)!        
        let analyticsService = container.resolve(AnalyticsServiceProtocol.self)!
        let adService = container.resolve(AdServiceProtocol.self)!
        let cacheService = container.resolve(CacheServiceProtocol.self)!
        let storage = container.resolve(LocalStorage.self)!
        
        let tabBarController = UITabBarController()
                
        let userService = UserService(networkingService: networkingService)
        
        let homeViewModel = HomeViewModel(
            networkingService: networkingService,
            analyticsService: analyticsService,
            adService: adService
        )
        
        let favoriteViewModel = FavoriteViewModel(
            cacheService: cacheService,
            analyticsService: analyticsService,
            storage: storage
        )
        
        let settingsViewModel = SettingsViewModel(
            userService: userService,
            analyticsService: analyticsService
        )
        
        let homeVC = HomeViewController(viewModel: homeViewModel)
        homeVC.tabBarItem = UITabBarItem(
            title: "Home",
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        let homeNavController = UINavigationController(
            rootViewController: homeVC
        )
           
        let favoriteVC = FavoriteViewController(viewModel: favoriteViewModel)
            favoriteVC.tabBarItem = UITabBarItem(
                title: "Favorites",
                image: UIImage(systemName: "star"),
                selectedImage: UIImage(systemName: "star.fill")
        )
        let favoriteNavController = UINavigationController(
            rootViewController: favoriteVC
        )
        
        
        let settingsVC = SettingsViewController(viewModel: settingsViewModel)
        settingsViewModel.delegate = self
        settingsVC.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gearshape"),
            selectedImage: UIImage(systemName: "gearshape.fill")
        )
        let settingsNavController = UINavigationController(
            rootViewController: settingsVC
        )
        
        tabBarController.viewControllers = [
            homeNavController,
            favoriteNavController,
            settingsNavController
        ]
        navigationController.setViewControllers([tabBarController], animated: true)
        navigationController.isNavigationBarHidden = true
    }
}

extension MainCoordinator: SettingsViewModelDelegate {
    func onLoggedOut() {
        showLoginScreen()
    }
}
