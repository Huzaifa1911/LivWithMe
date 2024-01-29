//
//  Raleway.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 15/01/2024.
//

import UIKit


enum Raleway: String {
    case black = "Black"
    case blackItalic = "BlackItalic"
    case bold = "Bold"
    case boldItalic = "BoldItalic"
    case extraBold = "ExtraBold"
    case extraBoldItalic = "ExtraBoldItalic"
    case extraLight = "ExtraLight"
    case extraLightIalic = "ExtraLightItalic"
    case italic = "Italic"
    case light = "Light"
    case lightItalic = "LightItalic"
    case medium = "Medium"
    case mediumItalic = "MediumItalic"
    case regular = "Regular"
    case semiBold = "SemiBold"
    case semiBoldItalic = "SemiBoldItalic"
    case thin = "Thin"
    case thinItalic = "ThinItalic"
    
    
    var fontName: String {
        "Raleway-\(rawValue)"
    }
}
