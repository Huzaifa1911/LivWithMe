//
//  UITextField+Extension.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 16/01/2024.
//

import UIKit

extension UITextField {
    func raleway(font: Raleway = .regular, size: CGFloat = 14, color: UIColor? = .appTheme.text) {
        guard let customFont = UIFont(name: font.fontName, size: size) else {
            fatalError("""
                    Failed to load the \(font.fontName) font.
                    Make sure the font file is included in the project and the font name is spelled correctly.
                    """
            )
        }
        
        self.font = UIFontMetrics.default.scaledFont(for: customFont)
        self.textColor = color
        self.adjustsFontForContentSizeCategory = true
    }
}
