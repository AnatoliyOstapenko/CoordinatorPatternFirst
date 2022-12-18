//
//  UIView+Ext.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 18.12.2022.
//

import UIKit

extension UIStackView {
    
    func addAllSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
    
}



