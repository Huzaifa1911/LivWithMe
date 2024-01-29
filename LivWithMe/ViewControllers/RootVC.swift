//
//  RootVC.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit

class RootVC: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    private var homeVC: HomeVC
    private var drawerState: DrawerState
    private var originalTransform: CGAffineTransform
    
    private lazy var drawerView: DrawerContentView = {
        let view = DrawerContentView(drawerItems: DrawerItem.allCases)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init() {
        homeVC = HomeVC()
        originalTransform = homeVC.view.transform
        drawerState = .closed
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .appTheme.darkBlue
        homeVC.delegate = self
        homeVC.coordinator = coordinator
        addChild(homeVC)
        view.addSubview(drawerView)
        view.addSubview(homeVC.view)
        homeVC.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            drawerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            drawerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            drawerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
    
}


extension RootVC: HomeVCDelegate {
    func didSwipeRight() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            let x = self.view.screenWidth * 0.75
            let scaledAndTranslatedTransform = self.homeVC.view.transform.scaledBy(x: 0.75, y: 0.85).translatedBy(x: x, y: 0)
            self.homeVC.view.transform = scaledAndTranslatedTransform


        } completion: { done in
            if done {
                self.drawerState = .opened
            }
        }
    }

    func didSwipeLeft() {
        UIView.animate(withDuration: 0.3, delay: 0) {
            self.homeVC.view.transform = self.originalTransform
        } completion: { done in
            if done {
                self.drawerState = .closed
            }
        }
    }
}
