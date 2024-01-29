//
//  String+Extension.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 25/01/2024.
//

import UIKit

extension String {
    func sizeOfString(usingFont font: UIFont) -> CGSize {
        let attributes = [NSAttributedString.Key.font: font]
        return (self as NSString).size(withAttributes: attributes)
    }
}
