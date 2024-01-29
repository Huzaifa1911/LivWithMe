//
//  AppSearchBar.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 16/01/2024.
//

import UIKit

class AppSearchbar: UIView {
    
    lazy var searchTextField: UITextField =  {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.raleway(font: .regular, size: 12, color: .appTheme.secondaryText)
        return textField
        
    }()
    
    lazy var searchIcon: IconButton = {
        let button = IconButton(icon: .icons.magnifyingGlass, size: 24)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.icon.tintColor = .appTheme.secondaryText
        button.layer.cornerRadius = 0
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupView() {
        layer.cornerRadius = 16
        backgroundColor = .appTheme.chip
        translatesAutoresizingMaskIntoConstraints = false
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: 6, leading: 12, bottom: 6, trailing: 70)
        addSubview(searchIcon)
        addSubview(searchTextField)
        
        // Constraints
        NSLayoutConstraint.activate([
            searchIcon.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            searchIcon.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            searchIcon.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            // searchTextInput
            searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: Margins.reg),
            searchTextField.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            searchTextField.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
        ])
    }
    
    
}
