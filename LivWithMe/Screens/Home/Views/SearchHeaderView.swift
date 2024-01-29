//
//  SearchHeaderView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit

class SearchHeaderView: UICollectionReusableView {
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.raleway(font: .regular, size: 12, color: .appTheme.secondaryText)
        label.text = "Location"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationSelectorButton: Chip = {
        let button = Chip(label: "Jakarta", rightIcon: .icons.chevronDownIcon)
        button.rightIcon.tintColor = .appTheme.secondaryText
        button.tapHandler = handleLocationButtonTap
        return button
    }()
    
    private lazy var bellIcon: IconButton = {
        let button = IconButton(icon: .icons.bellIcon, size: 24)
        button.icon.tintColor = .appTheme.text
        button.backgroundColor = .appTheme.background
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var searchBar: AppSearchbar = {
        let searchBar = AppSearchbar()
        searchBar.searchTextField.placeholder = "Search address, or near you"
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var filterButton: TouchableView = {
        let imageView = UIImageView(image: .icons.filterIcon)
        let view = TouchableView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.tintColor = .appTheme.background
        
        view.addSubview(imageView)
        view.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        imageView.heightAnchor.constraint(greaterThanOrEqualToConstant: 24).isActive = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        filterButton.applyGradient(colorArray: UIColor.appTheme.oceanGradient, cornerRadius: 10)
    }
    
    private func handleLocationButtonTap() {
        print("Handled")
    }
    
    private func setupView() {
        addSubview(locationLabel)
        addSubview(locationSelectorButton)
        addSubview(bellIcon)
        addSubview(searchBar)
        addSubview(filterButton)

        NSLayoutConstraint.activate([
            // location label constraints
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            locationLabel.topAnchor.constraint(equalTo: topAnchor),
            
            // location selector button constraints
            locationSelectorButton.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: Margins.xs),
            locationSelectorButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            // bellicon constraints
            bellIcon.trailingAnchor.constraint(equalTo: trailingAnchor),
            bellIcon.topAnchor.constraint(equalTo: topAnchor),
            
            // search bar constraints
            searchBar.topAnchor.constraint(equalTo: locationSelectorButton.bottomAnchor, constant: Margins.xl),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
            searchBar.bottomAnchor.constraint(equalTo: bottomAnchor),

            filterButton.leadingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: Margins.xs),
            filterButton.topAnchor.constraint(equalTo:locationSelectorButton.bottomAnchor, constant: Margins.xl),
            filterButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            filterButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterButton.heightAnchor.constraint(equalTo: searchBar.heightAnchor),
            filterButton.widthAnchor.constraint(equalTo: filterButton.heightAnchor),
        ])
    }
}
