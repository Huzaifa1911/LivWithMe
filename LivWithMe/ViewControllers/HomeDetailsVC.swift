//
//  HomeDetailsVC.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 26/01/2024.
//

import UIKit

class HomeDetailsVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private let homeDetailsScreenView: HomeDetailsScreenView
    private let homePricingView: HomePricingView
    
    init(home: Home) {
        homeDetailsScreenView = HomeDetailsScreenView(for: home)
        homePricingView = HomePricingView(for: home)
        super.init(nibName: nil, bundle: nil)
        homeDetailsScreenView.homeDetailDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    private func setupViews() {
        view.backgroundColor = .appTheme.background
        homeDetailsScreenView.translatesAutoresizingMaskIntoConstraints = false
        homePricingView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(homeDetailsScreenView)
        view.addSubview(homePricingView)
        
        NSLayoutConstraint.activate([
            homeDetailsScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeDetailsScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeDetailsScreenView.topAnchor.constraint(equalTo: view.topAnchor),
            
            homePricingView.topAnchor.constraint(equalTo: homeDetailsScreenView.bottomAnchor),
            homePricingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            homePricingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margins.lg),
            homePricingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margins.lg)
        ])
    }
}


extension HomeDetailsVC: HomeDetailsViewScreenDelegate {
    func didTapHomeContentViewBackButton() {
        coordinator?.didTapHomeDetailBackButton()
    }
}
