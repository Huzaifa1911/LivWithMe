//
//  View+Extension.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit

extension UIView {
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    func applyGradient(colorArray: [UIColor], locations: [NSNumber] = [0.0, 1.0], cornerRadius: CGFloat = 0) {
        layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colorArray.map({ $0.cgColor })
        gradientLayer.locations = locations
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = cornerRadius
        
        backgroundColor = .clear
        layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func removeGradient() {
        if let _ = self.layer.sublayers?.first as? CAGradientLayer {
            self.layer.sublayers?.remove(at: 0)
        }
    }
}
