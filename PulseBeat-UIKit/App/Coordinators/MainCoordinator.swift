//
//  MainCoordinator.swift
//  PulseBeat-UIKit
//
//  Created by nhat on 23/11/24.
//
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLoginScreen()
    }
    
    private func showLoginScreen() {
        let loginViewModel = LoginViewModel()
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
        let tabBarController = UITabBarController()
        
        let homeViewModel = HomeViewModel()
        let favoriteViewModel = FavoriteViewModel()
        let settingsViewModel = SettingsViewModel()
        
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
