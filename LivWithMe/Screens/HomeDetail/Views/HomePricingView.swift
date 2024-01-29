//
//  HomePricingView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 25/01/2024.
//

import UIKit

class HomePricingView: UIView {
    private var home: Home
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Price"
        label.raleway(font: .regular, size: 12, color: .appTheme.secondaryText)
        return label
    }()
    
    private lazy var homePrice: UILabel = {
        let label = UILabel()
        label.text = "Rp. \(home.price) / \(home.rentDuration)"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 16)
        return label
    }()
    
    private lazy var rentButton: GradientButton = {
        let button = GradientButton(label: "Rent Now")
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(for home: Home) {
        self.home = home
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(priceLabel)
        addSubview(homePrice)
        addSubview(rentButton)
        
        NSLayoutConstraint.activate([
            priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            priceLabel.topAnchor.constraint(equalTo: topAnchor, constant: Margins.xs),
            
            homePrice.leadingAnchor.constraint(equalTo: leadingAnchor),
            homePrice.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: Margins.xs),
            homePrice.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            rentButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            rentButton.topAnchor.constraint(equalTo: priceLabel.topAnchor),
            rentButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
