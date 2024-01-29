//
//  HomeDetailManager.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 19/01/2024.
//

import Foundation


class HomeDetailManager {
    static let shared = HomeDetailManager()
    private var home: Home?
    
    weak var controllerDelegate: NavigaitonDelegateProtocol?
    
    private init () {}
    
    
    func getHome() -> Home {
        home!
    }
    
    @objc func goBack() {
        controllerDelegate?.goBack()
    }
    
    func setHome(with home: Home) {
        self.home = home
    }
}
