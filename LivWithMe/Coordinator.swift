//
//  Coordinator.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 22/01/2024.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    func didTapHome(home: Home)
    func didTapHomeDetailBackButton()
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}


class MainCoordinator: Coordinator {
    func didTapHomeDetailBackButton() {
        navigationController?.popViewController(animated: true)
    }
    
    var navigationController: UINavigationController?
    
    func didTapHome(home: Home) {
        let homeDetailVC = HomeDetailsVC(home: home)
        homeDetailVC.coordinator = self
        navigationController?.pushViewController(homeDetailVC, animated: true)
    }
    
    func start() {
        let vc = RootVC()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: true)
    }
}
