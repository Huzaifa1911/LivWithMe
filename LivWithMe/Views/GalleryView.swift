//
//  GalleryView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 25/01/2024.
//

import UIKit
import Kingfisher

class GalleryView: UIStackView {
    private var images: [String] = []
    private var visibleImageLimit: Int = 0
    
    private var hasMoreImages: Bool {
        images.count > visibleImageLimit
    }
    
    private lazy var hiddenImagesCountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 20, color: .appTheme.background)
        label.text = "+\(images.count > visibleImageLimit ? (images.count - visibleImageLimit): 0)"
        return label
    }()
    
    private lazy var imageViews: [UIImageView] = {
        var views: [UIImageView] = []
        for i in 1...visibleImageLimit {
            let view = UIImageView()
            view.kf.indicatorType = .activity
            view.setImage(urlString: images[i - 1], downsamplingSize: .init(width: 150, height: 150))
            view.backgroundColor = .appTheme.chip
            view.clipsToBounds = true
            view.layer.cornerRadius = 10
            view.isUserInteractionEnabled = true
            view.translatesAutoresizingMaskIntoConstraints = false
            if i == visibleImageLimit && hasMoreImages {
                view.addSubview(hiddenImagesCountLabel)
                hiddenImagesCountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                hiddenImagesCountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            }
            views.append(view)
        }
        return views
    }()
    
    init(for images: [String] = []) {
        self.images = images
        self.visibleImageLimit = images.count > 4 ? 4: images.count
        super.init(frame: .zero)
        setupViews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        for (index, view) in imageViews.enumerated() {
            view.frame.size = .init(width: 85, height: 85) // TODO: Should need to be refactored
            if index == visibleImageLimit - 1 && hasMoreImages {
                view.applyGradient(colorArray: UIColor.appTheme.grayGradient, locations: [0.0, 1.0], cornerRadius: 10)
            }
        }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        axis = .horizontal
        distribution = .fillEqually
        alignment = .leading
        spacing = Margins.lg
        
        for view in imageViews {
            addArrangedSubview(view)
        }
    }
}
