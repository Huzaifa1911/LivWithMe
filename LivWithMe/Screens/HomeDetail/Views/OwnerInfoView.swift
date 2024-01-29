//
//  OwnerInfoView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 25/01/2024.
//

import UIKit
import Kingfisher

class OwnerInfoView: UIView {
    private var owner: Owner
    
    private lazy var avatar: UIImageView = {
        let view = UIImageView()
        view.setImage(urlString: owner.profileImage, downsamplingSize: CGSize(width: 60, height: 60))
        view.backgroundColor = .appTheme.chip
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.text = owner.name
        label.raleway(font: .semiBold, size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ownerDesc: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Owner"
        label.raleway(font: .regular, size: 12, color: .appTheme.secondaryText)
        return label
    }()
    
    private lazy var phoneButton: IconButton = {
        let button = IconButton(icon: .icons.phoneIcon, size: 24)
        button.backgroundColor = .appTheme.oceanBlue
        button.icon.tintColor = .appTheme.background
        button.layer.cornerRadius = 5
        return button
    }()
    
    private lazy var messageButton: IconButton = {
        let button = IconButton(icon: .icons.messageFillIcon, size: 24)
        button.backgroundColor = .appTheme.oceanBlue
        button.icon.tintColor = .appTheme.background
        button.layer.cornerRadius = 5
        return button
    }()
    
    init(for owner: Owner) {
        self.owner = owner
        super.init(frame: .zero)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        avatar.frame.size = .init(width: 40, height: 40)
        avatar.layer.cornerRadius = avatar.frame.height / 2
    }
    
    private func setupViews() {
        addSubview(avatar)
        addSubview(name)
        addSubview(ownerDesc)
        addSubview(messageButton)
        addSubview(phoneButton)
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: leadingAnchor),
            avatar.topAnchor.constraint(equalTo: topAnchor),
            avatar.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: Margins.md),
            name.topAnchor.constraint(equalTo: topAnchor),
            
            ownerDesc.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            ownerDesc.topAnchor.constraint(equalTo: name.bottomAnchor, constant: Margins.xxs),

            messageButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            messageButton.topAnchor.constraint(equalTo: topAnchor),
            messageButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            phoneButton.topAnchor.constraint(equalTo: topAnchor),
            phoneButton.trailingAnchor.constraint(equalTo: messageButton.leadingAnchor, constant: -Margins.lg),
            phoneButton.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}
