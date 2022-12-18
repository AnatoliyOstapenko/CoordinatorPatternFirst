//
//  Coordinator.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import Foundation
import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var children: [MainCoordinator]? { get set } // optional property
    var navController: UINavigationController? { get set }
    func eventOccured(with type: Event)
    func start()
}

protocol CoordinatorDelegate {
    var coordinator: MainCoordinator? { get set }
}

class MainCoordinator: Coordinator {
    var children: [MainCoordinator]? = nil // nil when there is only one coordinator

    var navController: UINavigationController?
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            let vc = SecondViewController()
            vc.textString = "transfer data from coordinator"
            navController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        let vc = FirstViewController()
        vc.coordinator = self
        navController?.pushViewController(vc, animated: false)
    }
}
