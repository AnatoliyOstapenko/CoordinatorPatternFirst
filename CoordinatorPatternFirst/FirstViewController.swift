//
//  ViewController.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import UIKit

class FirstViewController: UIViewController, CoordinatorDelegate {
    
    var coordinator: MainCoordinator?
    let goToSecondVCButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First ViewController"
        view.backgroundColor = .cyan
        goToSecondVCButtonConfigure()
    }
    
    func goToSecondVCButtonConfigure() {
        view.addSubview(goToSecondVCButton)
        goToSecondVCButton.translatesAutoresizingMaskIntoConstraints = false
        goToSecondVCButton.layer.cornerRadius = 8
        goToSecondVCButton.backgroundColor = .systemGray
        goToSecondVCButton.setTitle(" to the second screen ", for: .normal)
        goToSecondVCButton.setTitleColor(.cyan, for: .normal)
        goToSecondVCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        goToSecondVCButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        goToSecondVCButton.addTarget(self, action: #selector(goToSecondVCButtonPressed(sender:)), for: .touchUpInside)
            
    }
    
    @objc func goToSecondVCButtonPressed(sender: Any?) {
        coordinator?.eventOccured(with: .buttonTapped)
    }


}


