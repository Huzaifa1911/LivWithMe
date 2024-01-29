//
//  GradientButton.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 26/01/2024.
//

import UIKit

class GradientButton : TouchableView {
    private var gradientColor: [UIColor] = UIColor.appTheme.oceanGradient
    private var roundness: Int = 10
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 16, color: .appTheme.background)
        return label
    }()
    
    init(label: String,
         gradientColor: [UIColor]? = UIColor.appTheme.oceanGradient,
         textColor: UIColor? = .appTheme.background, roundness: Int? = 10) {
        super.init(frame: .zero)
        self.gradientColor = gradientColor!
        self.roundness = roundness!
        self.label.text = label
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        applyGradient(colorArray: gradientColor, cornerRadius: layer.cornerRadius)
    }
    
    private func setupViews() {
        layer.cornerRadius = 10
        directionalLayoutMargins = .init(top: Margins.reg, leading: Margins.xl, bottom: Margins.reg, trailing: Margins.xl)
        
        addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
        ])
        
    }
}
