//
//  CategoryView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import UIKit

class CategoryViewCell: UICollectionViewCell {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.raleway(font: .regular, size: 12, color: .appTheme.text)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override var isSelected: Bool {
        didSet {
            didSelectCategory()
        }
    }
    
    private func setupViews() {
        contentView.addSubview(label)
        isUserInteractionEnabled = true
        layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
    
    private func didSelectCategory() {
        if isSelected {
            contentView.applyGradient(colorArray: UIColor.appTheme.oceanGradient, cornerRadius: 10)
            label.textColor = .appTheme.background
        } else {
            contentView.removeGradient()
            backgroundColor = .appTheme.chip
            label.textColor = .appTheme.text
        }
    }
    
    func configure(_ category: Category) {
        label.text = category.name
    }
}
