//
//  HomeFeatureView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import UIKit

class HomeFeatureView: UIView {
    private var iconSize: CGFloat = 24
    private let containerOffset: CGFloat = 4
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .regular, size: 12, color: .appTheme.secondaryText)
        label.sizeToFit()
        return label
    }()
    
    lazy var icon: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        imageView.layer.cornerRadius = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appTheme.secondaryText
        return imageView
    }()
    
    init(icon: UIImage? = nil, label: String? = "", iconSize: CGFloat = 24) {
        super.init(frame: .zero)
        self.icon.image = icon
        self.label.text = label
        self.iconSize = iconSize
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(icon)
        addSubview(label)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: iconSize),
            icon.widthAnchor.constraint(equalToConstant: iconSize),
            
            icon.leadingAnchor.constraint(equalTo: leadingAnchor),
            icon.topAnchor.constraint(equalTo: topAnchor),
            icon.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            label.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: Margins.xs),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            label.topAnchor.constraint(equalTo: topAnchor),
            label.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
       
    }
}
