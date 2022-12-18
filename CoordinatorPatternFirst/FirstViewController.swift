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
    
    private var signingIn = false {
        didSet {
            goToSecondVCButton.setNeedsUpdateConfiguration()
        }
    }
    
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "First ViewController"
        view.backgroundColor = .systemBackground
        goToSecondVCButtonConfigure()
    }
    
    func goToSecondVCButtonConfigure() {
        view.addSubview(goToSecondVCButton)

        var config = UIButton.Configuration.tinted()

        config.buttonSize = .large
        config.cornerStyle = .medium
        config.title = "Sign In"
        config.image = UIImage(systemName: "chevron.right")
        config.imagePadding = 8
        config.imagePlacement = .trailing // set image on the right
        config.baseBackgroundColor = .systemRed
        config.baseForegroundColor = .systemRed
        config.preferredSymbolConfigurationForImage
          = UIImage.SymbolConfiguration(scale: .medium) // size of image

        config.titleTextAttributesTransformer =
          UIConfigurationTextAttributesTransformer { incoming in
            // 1
            var outgoing = incoming
            // 2
            outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
            // 3
            return outgoing
          }
        
        goToSecondVCButton.configurationUpdateHandler = { [unowned self] button in
            // 1
            var config = button.configuration

            // 2
            config?.showsActivityIndicator = self.signingIn
            // 3
            config?.imagePlacement = self.signingIn ? .leading : .trailing
            // 4
            config?.title = self.signingIn ? "Signing In..." : "Sign In"

            // 5
            button.isEnabled = !self.signingIn

            // 6
            button.configuration = config
        }
        
        goToSecondVCButton.configuration = config

        // Action
        goToSecondVCButton.addTarget(self, action: #selector(goToSecondVCButtonPressed), for: .touchUpInside)

        
        // Layout
        goToSecondVCButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            goToSecondVCButton.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            goToSecondVCButton.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            goToSecondVCButton.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor)
        ])
    }
    
    @objc func goToSecondVCButtonPressed(sender: Any?) {
        //        coordinator?.eventOccured(with: .buttonTapped)
        self.signingIn = true
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.signingIn = false
            self.coordinator?.eventOccured(with: .buttonTapped)
        }
    }


}


