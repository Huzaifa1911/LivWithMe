//
//  IconButton.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 16/01/2024.
//

import UIKit

class Chip: TouchableView {
    lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.raleway(font: .semiBold, size: 20)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .appTheme.text
        imageView.contentMode = .scaleAspectFit
        imageView.sizeToFit()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var rightIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .appTheme.text
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 5
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    init(label: String = "", leftIcon: UIImage? = nil, rightIcon: UIImage? = nil) {
        super.init(frame: .zero)
        self.label.text = label
        self.leftIcon.image = leftIcon
        self.rightIcon.image = rightIcon
        setupViews()
    }
    
    private func setupViews() {
        
        if leftIcon.image.isNotNil {
            stackView.addArrangedSubview(leftIcon)
        }
        stackView.addArrangedSubview(label)
        if rightIcon.image.isNotNil {
            stackView.addArrangedSubview(rightIcon)
        }
        addSubview(stackView)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            rightIcon.heightAnchor.constraint(equalToConstant: 18),
            rightIcon.widthAnchor.constraint(equalToConstant: 18),
            
            leftIcon.heightAnchor.constraint(equalToConstant: 18),
            leftIcon.widthAnchor.constraint(equalToConstant: 18),
        ])
    }
}
