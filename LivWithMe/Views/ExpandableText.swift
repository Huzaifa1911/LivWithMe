//
//  ExpandableTextView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 22/01/2024.
//

import UIKit

class ExpandableText: UILabel {
    
    private var isExpanded: Bool = false
    private var shrinkedText: String = ""
    private var lineLimit: Int = 0
    private var seeMoreLabel: String {
        isExpanded ? "See less": "See More"
    }
    
    init(text: String, lineLimit: Int = 2, font: UIFont? = UIFont(name:  Raleway.regular.fontName, size: 12)) {
        super.init(frame: .zero)
        self.text = text
        self.numberOfLines = lineLimit
        self.lineLimit = lineLimit
        self.shrinkedText = text
        self.font = font
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if isExpanded.inverted { willExpand() } // only expand if isExpanded = false
    }
    
    private func willExpand() {
        numberOfLines = lineLimit
        let labelText: NSString = NSString(string: shrinkedText)
        var truncatedText: NSString = labelText
        var endIndex = NSRange(location: 0, length: labelText.length).upperBound
        
        while truncatedText.boundingRect(
            with: .init(width: bounds.width, height: CGFloat.greatestFiniteMagnitude),
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font!],
            context: nil).size.height >= getRequiredHeight() {
            
            // if completed string iterated, stop the loop
            if endIndex == 0 {
                break
            }
            
            endIndex -= 1
            // remove the last char and recalculate bounds
            truncatedText = NSString(string: labelText.substring(with: NSRange(location: 0, length: endIndex)))
            truncatedText = "\(truncatedText)...\(seeMoreLabel)" as NSString
        }
        
        text = truncatedText as String
        highlightSeeMoreLabel()
    }
    
    private func willCollapsed() {
        numberOfLines = 0
        self.text = "\(shrinkedText) \(seeMoreLabel)"
        highlightSeeMoreLabel()
    }
    
    private func getRequiredHeight() -> CGFloat {
        let newLines = String(repeating: "\n", count: numberOfLines)
        let size = newLines.sizeOfString(usingFont: font!)
        return size.height
    }
    
    private func highlightSeeMoreLabel() {
        guard let labelText = text else { return }
        let range = (labelText as NSString).range(of: seeMoreLabel)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: labelText)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.appTheme.darkBlue!, range: range)
        self.attributedText = mutableAttributedString
    }
    
    private func setupViews() {
        isUserInteractionEnabled = true
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapLabel(_:))))
    }
    
    @objc private func didTapLabel(_ sender: UITapGestureRecognizer) {
        if shrinkedText == text! { return } // if complete text already rendered, no need to append see less
        self.isExpanded.toggle()
        self.isExpanded ? self.willCollapsed() : self.willExpand()
    }
}

