//
//  Color+Extension.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit

extension UIColor {
    
    struct appTheme {
        static let chip = UIColor(named: "chip")
        static let darkBlue = UIColor(named: "darkBlue")
        static let lightBlue = UIColor(named: "lightBlue")
        static let secondaryText = UIColor(named: "secondaryText")
        static let text = UIColor(named: "text")
        static let background = UIColor(named: "background")
        static let paleGray = UIColor(named: "paleGray")
        static let oceanBlue = UIColor.init(red: 0.04, green: 0.56, blue: 0.85, alpha: 0.5)
        static let darkGray = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.25)
        static let oceanGradient = [UIColor(red: 0.63, green: 0.85, blue: 0.98, alpha: 1), UIColor(red: 0.04, green: 0.56, blue: 0.85, alpha: 0.8)]
        static let grayGradient = [UIColor(red: 0.05, green: 0.05, blue: 0.05, alpha: 0), UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)]
        
    }
    
    convenience init(hex: String) {
        let hexString = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
