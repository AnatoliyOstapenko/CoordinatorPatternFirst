//
//  UIView+Ext.swift
//  CoordinatorPatternFirst
//
//  Created by AnatoliiOstapenko on 18.12.2022.
//

import UIKit

extension UIView {
    
    func addAllSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
    
}

