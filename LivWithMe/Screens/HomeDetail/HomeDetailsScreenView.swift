//
//  HomeDetailsView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 26/01/2024.
//

import UIKit

protocol HomeDetailsViewScreenDelegate: AnyObject {
    func didTapHomeContentViewBackButton()
}

class HomeDetailsScreenView: VerticalScrollableView {
    private var home: Home
    
    weak var homeDetailDelegate: HomeDetailsViewScreenDelegate? = nil
    
    private lazy var homeInfoView: HomeInfoView = {
        let view = HomeInfoView(for: home)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        return view
    }()
    
    private lazy var homeDescriptionView: HomeDescriptionView = {
        let view = HomeDescriptionView(with: home.description)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var ownerInfoView: OwnerInfoView = {
        let owner = OwnerInfoView(for: home.owner)
        owner.translatesAutoresizingMaskIntoConstraints = false
        return owner
    }()
    
    private lazy var homeImagesView: HomeImagesView = {
        let view = HomeImagesView(images: home.images)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var homeLocationView: HomeLocationView = {
        let view = HomeLocationView(for: home.location)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        contentView.directionalLayoutMargins = .init(top: 0, leading: Margins.lg, bottom: Margins.lg, trailing: Margins.lg)
        
        contentView.addSubview(homeInfoView)
        contentView.addSubview(homeDescriptionView)
        contentView.addSubview(ownerInfoView)
        contentView.addSubview(homeImagesView)
        contentView.addSubview(homeLocationView)
        
        NSLayoutConstraint.activate([
            homeInfoView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            homeInfoView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            homeInfoView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            
            homeDescriptionView.topAnchor.constraint(equalTo: homeInfoView.bottomAnchor, constant: Margins.lg),
            homeDescriptionView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            homeDescriptionView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            ownerInfoView.topAnchor.constraint(equalTo: homeDescriptionView.bottomAnchor, constant: Margins.lg),
            ownerInfoView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            ownerInfoView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            homeImagesView.topAnchor.constraint(equalTo: ownerInfoView.bottomAnchor, constant: Margins.lg),
            homeImagesView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            homeImagesView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            
            homeLocationView.topAnchor.constraint(equalTo: homeImagesView.bottomAnchor, constant: Margins.lg),
            homeLocationView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            homeLocationView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            homeLocationView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
}

extension HomeDetailsScreenView: HomeInfoViewDelegate {
    func didTapHomeInfoViewBackButton() {
        homeDetailDelegate?.didTapHomeContentViewBackButton()
    }
}

