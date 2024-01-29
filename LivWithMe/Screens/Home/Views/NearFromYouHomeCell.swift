//
//  NearFromYouHomeCell.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import UIKit
import Kingfisher

class NearFromYouHomeCell: UICollectionViewCell {
    
    lazy var homeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.kf.indicatorType = .activity
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var homeName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 16, color: .appTheme.background)
        label.sizeToFit()
        return label
    }()
    
    lazy var homeAddress: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .regular, size: 12, color: .appTheme.paleGray)
        label.sizeToFit()
        return label
    }()
    
    lazy var distanceChip: Chip = {
        let chip = Chip(leftIcon: .icons.mapMarkerIcon)
        chip.directionalLayoutMargins = .init(top: Margins.xxs, leading: Margins.sm, bottom: Margins.xxs, trailing: Margins.sm)
        chip.backgroundColor = .appTheme.darkGray
        chip.layer.cornerRadius = 13
        chip.label.raleway(font: .regular, size: 12, color: .appTheme.background)
        chip.isUserInteractionEnabled = false
        return chip
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Apply the gradient only if it has not been applied before
        if homeImage.layer.sublayers?.first(where: { $0 is CAGradientLayer }) == nil {
            homeImage.applyGradient(colorArray: UIColor.appTheme.grayGradient, locations: [0.6, 1.0], cornerRadius: 20)
        }
        
    }
    
    private func setupViews() {
        isUserInteractionEnabled = true
        layer.cornerRadius = 20
        backgroundColor = .appTheme.chip
        
        contentView.addSubview(homeImage)
        contentView.addSubview(homeName)
        contentView.addSubview(homeAddress)
        contentView.addSubview(distanceChip)
        contentView.directionalLayoutMargins = .init(top: Margins.lg, leading: Margins.lg, bottom: Margins.md, trailing: Margins.md)
        
        
        NSLayoutConstraint.activate([
            distanceChip.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            distanceChip.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            homeImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            homeImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            homeImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            homeImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            homeAddress.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            homeAddress.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            homeAddress.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
            
            homeName.bottomAnchor.constraint(equalTo: homeAddress.topAnchor, constant: -Margins.xs),
            homeName.leadingAnchor.constraint(equalTo: homeAddress.leadingAnchor),
            homeName.trailingAnchor.constraint(equalTo: homeAddress.trailingAnchor)
        ])
    }
    
    
    func configure(_ home: Home) {
        if let homeImageUrl = home.images.first {
            homeImage.setImage(urlString: homeImageUrl, downsamplingSize: CGSize(width: 500, height: 500))
            homeImage.layoutIfNeeded()
        } else {
            homeImage.image = nil
        }
        homeName.text = home.name
        homeAddress.text = home.location.name
        distanceChip.label.text = "\(home.distanceInKm) Km"
    }
}
