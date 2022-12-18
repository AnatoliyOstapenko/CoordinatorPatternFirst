//
//  ViewController.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import UIKit

class FirstVC: UIViewController {
        
    weak var coordinator: FirstVCCoordinatorProtocol?
    
    private let signInButton = GenericButton(title: "Sign In", image: Constants.chevron, color: .systemMint)
    private let helpButton = GenericButton(title: "Call 911", image: Constants.iPhone, color: .systemBlue)
    private let chatButton = GenericButton(title: "Chat", image: nil, color: .systemIndigo)
    
    private var signingIn = false {
        didSet {
            signInButton.setNeedsUpdateConfiguration() // Run configurationUpdateHandler
        }
    }
    
    private var getHelp = false {
        didSet { helpButton.setNeedsUpdateConfiguration() }
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
        updateUI()
        signInButtonConfigure()
        helpButtonConfigure()
        chatButtonConfigure()
    }
    
    private func chatButtonConfigure() {
        
        chatButton.showsMenuAsPrimaryAction = true
        
        chatButton.menu = UIMenu(children: [
            UIAction(title: "Dark Mode", image: Constants.mail) { _ in
                self.navigationController?.overrideUserInterfaceStyle = .dark
            },
            UIAction(title: "Send message", image: Constants.message) { _ in print("Start chating") }
        ])
        
        chatButton.changesSelectionAsPrimaryAction = true
//        chatButton.showsMenuAsPrimaryAction = true
    }
    
    private func signInButtonConfigure() {
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        
        // Update button UI while pressing on it
        signInButton.configurationUpdateHandler = { [unowned self] button in
            button.configuration?.showsActivityIndicator = self.signingIn
            button.configuration?.imagePlacement = self.signingIn ? .leading : .trailing
            button.configuration?.title = self.signingIn ? "Signing In..." : "Sign In"
            button.isEnabled = !self.signingIn
        }
    }
    
    private func helpButtonConfigure() {
        helpButton.addTarget(self, action: #selector(helpButtonPressed), for: .touchUpInside)
        
        helpButton.configurationUpdateHandler = { [unowned self] button in
            button.configuration?.image = self.getHelp ? Constants.call : Constants.iPhone
            button.configuration?.baseForegroundColor = self.getHelp ? .systemRed : .systemBlue
            button.configuration?.baseBackgroundColor = self.getHelp ? .systemRed : .systemBlue
            button.configuration?.title = self.getHelp ? "Calling to 911..." : "Call 911"
        }
    }
    
    private func updateUI() {
        title = "First ViewController"
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        stackView.addAllSubviews(signInButton, chatButton, helpButton)
        
        // Layout constraints
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            
            signInButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            helpButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            chatButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    @objc private func signInButtonPressed(sender: Any?) {
        self.signingIn = true
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.signingIn = false
            self.coordinator?.eventOccured(with: .buttonTapped)
        }
    }
    
    @objc private func helpButtonPressed() {
        self.getHelp = true
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.getHelp = false
        }
    }
}


