//
//  DrawerContentView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 27/01/2024.
//

import UIKit

class DrawerContentView: UIView {
    private var drawerItems: [DrawerItem]
    private var selectedDrawerItem: DrawerItem = .home

    private lazy var mainContentView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        for item in drawerItems {
            let view = DrawerItemView(item: item, isSelected: item == selectedDrawerItem)
            view.translatesAutoresizingMaskIntoConstraints = false
            stackView.addArrangedSubview(view)
            if item.shouldAddDivider {
                let divider = UIView()
                divider.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.5)
                divider.translatesAutoresizingMaskIntoConstraints = false
                divider.heightAnchor.constraint(equalToConstant: 2).isActive = true
                stackView.addArrangedSubview(divider)
            }
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    init(drawerItems: [DrawerItem]) {
        self.drawerItems = drawerItems
        super.init(frame: .zero)
        setupViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(mainContentView)
        backgroundColor = .appTheme.darkBlue
        
        directionalLayoutMargins = .init(top: 100, leading: 0, bottom: 100, trailing: 55)
        
        NSLayoutConstraint.activate([
            mainContentView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            mainContentView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            mainContentView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            mainContentView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
        ])
        
    }
}
