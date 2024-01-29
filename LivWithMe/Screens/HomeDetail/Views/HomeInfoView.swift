//
//  HomeInfoView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 19/01/2024.
//

import UIKit
import Kingfisher

protocol HomeInfoViewDelegate: AnyObject {
    func didTapHomeInfoViewBackButton()
}

class HomeInfoView: UIView {
    
    weak var delegate: HomeInfoViewDelegate?
    private var home: Home
    
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
        label.raleway(font: .semiBold, size: 20, color: .appTheme.background)
        label.sizeToFit()
        return label
    }()
    
    lazy var homeAddress: UILabel = {
        let label = UILabel()
        label.raleway(font: .regular, size: 12, color: .appTheme.paleGray)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.sizeToFit()
        return label
    }()
    
    lazy var backActionButton: IconButton = {
        let button = IconButton(icon: .icons.chevronLeftIcon)
        button.backgroundColor = .appTheme.darkGray
        button.icon.tintColor = .appTheme.background
        button.tapHandler = { [weak self] in
            self?.delegate?.didTapHomeInfoViewBackButton()
        }
        return button
    }()
    
    lazy var bookmarkButton: IconButton = {
        let button = IconButton(icon: .icons.bookmarkIcon)
        button.backgroundColor = .appTheme.darkGray
        button.icon.tintColor = .appTheme.background
        
        return button
    }()
    
    lazy var bedRoomsInHome: HomeFeatureView = {
        let feature = HomeFeatureView(icon: .icons.bedIcon.white, iconSize: 28)
        feature.icon.backgroundColor = .appTheme.darkGray
        feature.icon.tintColor = .appTheme.darkGray
        feature.label.textColor = .appTheme.paleGray
        return feature
    }()
    
    lazy var bathRoomsInHome: HomeFeatureView = {
        let feature = HomeFeatureView(icon: .icons.bathtubIcon.white, iconSize: 28)
        feature.icon.tintColor = .appTheme.background
        feature.icon.backgroundColor = .appTheme.darkGray
        feature.label.textColor = .appTheme.paleGray
        return feature
    }()
    
    init(for home: Home) {
        self.home = home
        super.init(frame: .zero)
        setupViews()
        configureHomeInfo(for: home)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        homeImage.applyGradient(colorArray: UIColor.appTheme.grayGradient, locations: [0.6, 1.0], cornerRadius: 20)
    }
    
    private func setupViews () {
        addSubview(homeImage)
        addSubview(backActionButton)
        addSubview(bookmarkButton)
        addSubview(bedRoomsInHome)
        addSubview(bathRoomsInHome)
        addSubview(homeAddress)
        addSubview(homeName)
        backgroundColor = .red
        layer.cornerRadius = 20
        directionalLayoutMargins = .init(top: Margins.lg, leading: Margins.lg, bottom: Margins.lg, trailing: Margins.lg)
        
        NSLayoutConstraint.activate([
            homeImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            homeImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            homeImage.topAnchor.constraint(equalTo: topAnchor),
            homeImage.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            backActionButton.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            backActionButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            
            bookmarkButton.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            bookmarkButton.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            
            bedRoomsInHome.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            bedRoomsInHome.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            
            bathRoomsInHome.leadingAnchor.constraint(equalTo: bedRoomsInHome.trailingAnchor, constant: Margins.xxl),
            bathRoomsInHome.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            bathRoomsInHome.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
            
            homeAddress.bottomAnchor.constraint(equalTo: bathRoomsInHome.topAnchor, constant: -Margins.lg),
            homeAddress.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            homeAddress.trailingAnchor.constraint(equalTo: bedRoomsInHome.trailingAnchor),
            
            homeName.bottomAnchor.constraint(equalTo: homeAddress.topAnchor, constant: -Margins.xs),
            homeName.leadingAnchor.constraint(equalTo: homeAddress.leadingAnchor),
            homeName.trailingAnchor.constraint(equalTo: homeAddress.trailingAnchor),
        ])
        
        let backActionBottomConstraint = backActionButton.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor)
        backActionBottomConstraint.priority = .defaultLow
        backActionBottomConstraint.isActive = true
    }
    
    private func configureHomeInfo(for home: Home) {
        if let homeImageUrl = home.images.first {
            homeImage.setImage(urlString: homeImageUrl, downsamplingSize: CGSize(width: 500, height: 500))
        } else {
            homeImage.image = nil
        }
        homeName.text = home.name
        homeAddress.text = home.location.name
        bedRoomsInHome.label.text =  "\(home.bedroomCount) Bedroom"
        bathRoomsInHome.label.text = "\(home.bathroomCount) Bathroom"
    }
}
