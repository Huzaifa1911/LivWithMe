//
//  HomeDescriptionView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 22/01/2024.
//

import UIKit

class HomeDescriptionView: UIView {
    private var descriptionForHome: String = ""
    
    private lazy var heading: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 16)
        label.text = "Description"
        return label
    }()
    
    private lazy var homeDescription: ExpandableText = {
        let label = ExpandableText(text: descriptionForHome, lineLimit: 2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(with description: String) {
        super.init(frame: .zero)
        self.descriptionForHome = description
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(heading)
        addSubview(homeDescription)
        
        NSLayoutConstraint.activate([
            heading.leadingAnchor.constraint(equalTo: leadingAnchor),
            heading.trailingAnchor.constraint(equalTo: trailingAnchor),
            heading.topAnchor.constraint(equalTo: topAnchor),
            
            homeDescription.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeDescription.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeDescription.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: Margins.lg),
            homeDescription.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
