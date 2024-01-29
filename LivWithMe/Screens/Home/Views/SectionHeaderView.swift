//
//  SectionHeaderView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.raleway(font: .semiBold, size: 16)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var seeMoreText: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See more", for: .normal)
        button.setTitleColor(.appTheme.secondaryText, for: .normal)
        button.titleLabel?.raleway(font: .regular, size: 12)
        return button
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(seeMoreText)
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    
    
}
