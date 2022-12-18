//
//  Coordinator.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import Foundation
import UIKit

enum Event { case buttonTapped }

protocol CoordinatorProtocol: AnyObject {
    var navController: UINavigationController { get set }
    func start()
}

protocol FirstVCCoordinatorProtocol: CoordinatorProtocol {
    func eventOccured(with type: Event)
}

class FirstVCCoordinator: FirstVCCoordinatorProtocol {

    var navController: UINavigationController
    init(navController: UINavigationController) { self.navController = navController }
        
    func start() {
        let vc = FirstVC()
        vc.coordinator = self
        navController.pushViewController(vc, animated: true)
    }
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            let vc = SecondViewController()
            vc.coordinator = self
            vc.textString = "transfer data from coordinator"
            navController.pushViewController(vc, animated: true)
        }
    }
    
}
