//
//  SceneDelegate.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navController = UINavigationController()
    var coordinator: FirstVCCoordinatorProtocol?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        coordinator = FirstVCCoordinator(navController: self.navController)
        coordinator?.start()
        configureNavController()
        window?.rootViewController = self.navController
        window?.makeKeyAndVisible()
    }
    
    private func configureNavController() {
        // Bar button color change
        navController.navigationBar.tintColor = .systemGray
        // Bar title color change
        navController.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.systemGray]
    }
}

