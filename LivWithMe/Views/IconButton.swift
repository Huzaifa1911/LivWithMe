//
//  IconButton.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 19/01/2024.
//

import UIKit

class IconButton : TouchableView {
    
    private var size: CGFloat = 18
    private let containerOffset: CGFloat = 16
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .appTheme.text
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(icon: UIImage? = nil, size: CGFloat = 18) {
        super.init(frame: .zero)
        self.icon.image = icon
        self.size = size
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        addSubview(icon)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 0.5 * (size + containerOffset)
        backgroundColor = .appTheme.chip
        
        NSLayoutConstraint.activate([
            icon.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            icon.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            icon.heightAnchor.constraint(greaterThanOrEqualToConstant: size),
            icon.widthAnchor.constraint(greaterThanOrEqualToConstant: size),
            heightAnchor.constraint(equalToConstant: size + containerOffset),
            widthAnchor.constraint(equalToConstant: size + containerOffset),
        ])
    }
}
