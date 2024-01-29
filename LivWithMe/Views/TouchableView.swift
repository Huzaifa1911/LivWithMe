//
//  TouchableView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 16/01/2024.
//

import UIKit

class TouchableView: UIView {
    
    @objc var tapHandler: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc private func onTap(_ gesture: UITapGestureRecognizer) {
        tapHandler?()
        guard gesture.state == .ended else { return }
        
        let fadeIn = UIViewPropertyAnimator(duration: 0.15, curve: .easeInOut) {
            self.alpha = 1
        }
        
        let fadeOut = UIViewPropertyAnimator(duration: 0.15, curve: .easeInOut) {
            self.alpha = 0.5
        }
        
        fadeOut.startAnimation()
        fadeOut.addCompletion { _ in
            fadeIn.startAnimation()
        }
    }
}
