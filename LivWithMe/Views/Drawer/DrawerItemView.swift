//
//  DrawerItemView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 27/01/2024.
//

import UIKit

class DrawerItemView: TouchableView {
    private var isSelected: Bool
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 16, color: isSelected ? .appTheme.darkBlue: .appTheme.background)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = isSelected ? .appTheme.darkBlue: .appTheme.background
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(item: DrawerItem, isSelected: Bool) {
        self.isSelected = isSelected
        super.init(frame: .zero)
        self.label.text = item.title
        self.icon.image = item.image
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(icon)
        addSubview(label)
        
        directionalLayoutMargins = .init(top: 10, leading: 30, bottom: 10, trailing: 55)
        backgroundColor = isSelected ? .appTheme.background : .appTheme.darkBlue
        layer.cornerRadius = 20
        layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 24),
            icon.widthAnchor.constraint(equalTo: heightAnchor),
            icon.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            icon.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            icon.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            label.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
    }
}
