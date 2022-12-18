//
//  ViewController.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 24.03.2022.
//

import UIKit

class FirstVC: UIViewController {
    
    
    weak var coordinator: FirstVCCoordinatorProtocol?
    
    private let signInButton = GenericButton(title: "Sign In", image: Constants.chevron, color: .systemRed)
    private let helpButton = GenericButton(title: "Help", image: Constants.iPhone, color: .systemBlue)
    
    private var signingIn = false {
        didSet {
            signInButton.setNeedsUpdateConfiguration()
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
        updateUI()
        signInButtonUpdateHadler()
    }
    
    private func signInButtonUpdateHadler() {
        
        signInButton.addTarget(self, action: #selector(signInButtonPressed), for: .touchUpInside)
        signInButton.configurationUpdateHandler = { [unowned self] button in
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
    }
    
    private func updateUI() {
        title = "First ViewController"
        view.backgroundColor = .systemBackground
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(helpButton)
        
        // Layout constraints
        
        NSLayoutConstraint.activate([
            stackView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
            
            signInButton.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            helpButton.widthAnchor.constraint(equalTo: stackView.widthAnchor)
        ])
    }

    @objc func signInButtonPressed(sender: Any?) {
        self.signingIn = true
        
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            self.signingIn = false
            self.coordinator?.eventOccured(with: .buttonTapped)
        }
    }


}


