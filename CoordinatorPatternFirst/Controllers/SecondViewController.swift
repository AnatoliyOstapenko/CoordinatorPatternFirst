//
//  SecondViewController.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var coordinator: FirstVCCoordinator?
    var textString: String?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        title = textString
        
    }
    
    


}
