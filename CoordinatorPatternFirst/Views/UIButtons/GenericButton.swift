//
//  GenericButton.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 18.12.2022.
//

import UIKit

class GenericButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(title: String, image: UIImage?, color: UIColor) {
        self.init(frame: .zero)
        configuration?.title = title
        configuration?.image = image
        configuration?.baseForegroundColor = color
        configuration?.baseBackgroundColor = color
    }
    
    private func configure() {
        configuration = .tinted()
        configuration?.buttonSize = .large
        configuration?.cornerStyle = .medium
        configuration?.imagePadding = 8
        configuration?.imagePlacement = .trailing // set image on the right
        configuration?.preferredSymbolConfigurationForImage
          = UIImage.SymbolConfiguration(scale: .medium) // size of image
        
        translatesAutoresizingMaskIntoConstraints = false
    
    }
    
}
