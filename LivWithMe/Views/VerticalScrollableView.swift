//
//  VerticalScrollableView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 18/01/2024.
//

import UIKit

class VerticalScrollableView: UIScrollView {
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .appTheme.background
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        backgroundColor = .appTheme.background
        addSubview(contentView)
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: frameLayoutGuide.widthAnchor),
        ])
        
        let heightConstraint = contentView.heightAnchor.constraint(equalTo: frameLayoutGuide.heightAnchor)
        heightConstraint.priority = .defaultLow
        heightConstraint.isActive = true

    }
}
