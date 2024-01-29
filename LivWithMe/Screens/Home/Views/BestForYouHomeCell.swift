//
//  BestForYouHomeCell.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 17/01/2024.
//

import UIKit
import Kingfisher


class BestForYouHomeCell: UICollectionViewCell {
    
    lazy var homeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .appTheme.chip
        imageView.kf.indicatorType = .activity
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var homeName: UILabel = {
        let label = UILabel()
        label.raleway(font: .semiBold, size: 16)
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var homePrice: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .regular, size: 12, color: .appTheme.darkBlue)
        label.sizeToFit()
        return label
    }()
    
    lazy var bedRoomsInHomeView: HomeFeatureView = {
        let feature = HomeFeatureView()
        feature.icon.image = .icons.bedIcon.gray
        return feature
    }()
    
    lazy var bathRoomsInHomeView: HomeFeatureView = {
        let feature = HomeFeatureView()
        feature.icon.image = .icons.bathtubIcon.gray
        return feature
    }()
    
    lazy var featureView: UIStackView = {
     let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addArrangedSubview(bedRoomsInHomeView)
        view.addArrangedSubview(bathRoomsInHomeView)
        view.spacing = 20
        view.distribution = .equalSpacing
        view.axis = .horizontal
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .equalSpacing
        view.axis = .vertical
        view.addArrangedSubview(homeName)
        view.addArrangedSubview(homePrice)
        view.addArrangedSubview(featureView)
        view.spacing = 8
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupViews() {
        contentView.addSubview(homeImage)
        contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            homeImage.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            homeImage.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
            homeImage.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            homeImage.widthAnchor.constraint(equalToConstant: 80),
            
            stackView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: homeImage.trailingAnchor, constant: 30),
        ])
    }
    
    func configure(_ home: Home) {
        if let homeImageUrl = home.images.first {
            homeImage.setImage(urlString: homeImageUrl, downsamplingSize: CGSize(width: 200, height: 200))
        } else {
            homeImage.image = nil
        }
        homeName.text = home.name
        homePrice.text = "Rp. \(home.price) / \(home.rentDuration)"
        bedRoomsInHomeView.label.text =  "\(home.bedroomCount) Bedroom"
        bathRoomsInHomeView.label.text = "\(home.bathroomCount) Bathroom"
    }
}
