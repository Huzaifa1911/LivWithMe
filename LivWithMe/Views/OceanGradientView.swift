//
//  OceanGradientView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import UIKit

class OceanGradientView: UIView {
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupView() {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [UIColor.appTheme.lightBlue!, UIColor.appTheme.darkBlue!]
        layer.insertSublayer(gradient, at: 0)
    }
}
