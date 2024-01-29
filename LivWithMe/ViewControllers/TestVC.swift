//
//  TestVC.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 26/01/2024.
//

import UIKit


protocol TestVCDelegate: AnyObject {
    func didTapMenu()
}

class TestVC: UIViewController {
    
    weak var delegate: TestVCDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "home"
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: .icons.bookmarkIcon, style: .done, target: self, action: #selector(didTapBellIcon))
    }
    
    @objc private func didTapBellIcon() {
        delegate?.didTapMenu()
    }
}
