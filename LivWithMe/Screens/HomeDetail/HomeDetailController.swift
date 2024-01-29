//
//  HomeDetailController.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 18/01/2024.
//

import UIKit

class HomeDetailController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private let homeDetailsContentView: HomeDetailsContentView
    private let homePricingView: HomePricingView
    
    init(home: Home) {
        homeDetailsContentView = HomeDetailsContentView(for: home)
        homePricingView = HomePricingView(for: home)
        super.init(nibName: nil, bundle: nil)
        homeDetailsContentView.homeDetailDelegate = self
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
        homeDetailsContentView.translatesAutoresizingMaskIntoConstraints = false
        homePricingView.translatesAutoresizingMaskIntoConstraints = false
       
        view.addSubview(homeDetailsContentView)
        view.addSubview(homePricingView)
        
        NSLayoutConstraint.activate([
            homeDetailsContentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeDetailsContentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeDetailsContentView.topAnchor.constraint(equalTo: view.topAnchor),
            
            homePricingView.topAnchor.constraint(equalTo: homeDetailsContentView.bottomAnchor),
            homePricingView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            homePricingView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Margins.lg),
            homePricingView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Margins.lg)
        ])
    }
}

extension HomeDetailController: HomeDetailsContentViewDelegate {
    func didTapHomeContentViewBackButton() {
        coordinator?.didTapHomeDetailBackButton()
    }
}
