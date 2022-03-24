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

protocol CoordinatorProtocol {
    var navController: UINavigationController? { get set }
    func eventOccured(with type: Event)
    func start()
}

protocol CoordinatorDelegate {
    var coordinator: Coordinator? { get set }
    
}

class Coordinator: CoordinatorProtocol {
    var navController: UINavigationController?
    
    func eventOccured(with type: Event) {
        switch type {
        case .buttonTapped:
            let vc = SecondViewController()
            navController?.pushViewController(vc, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & CoordinatorDelegate = FirstViewController()
        vc.coordinator = self
        navController?.setViewControllers([vc], animated: true) // remeber: navC is a stack of VC
    }
}
