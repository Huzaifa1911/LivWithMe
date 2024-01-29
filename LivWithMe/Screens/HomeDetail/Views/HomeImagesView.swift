//
//  HomeImagesView.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 25/01/2024.
//

import UIKit

class HomeImagesView: UIView {
    private var images: [String] = []
    
    private lazy var galleryView: GalleryView = {
        let view = GalleryView(for: images)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var heading: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.raleway(font: .semiBold, size: 16)
        label.text = "Gallery"
        return label
    }()
    
    init(images: [String]) {
        super.init(frame: .zero)
        self.images = images
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(heading)
        addSubview(galleryView)
        
        NSLayoutConstraint.activate([
            heading.leadingAnchor.constraint(equalTo: leadingAnchor),
            heading.trailingAnchor.constraint(equalTo: trailingAnchor),
            heading.topAnchor.constraint(equalTo: topAnchor),
            
            galleryView.leadingAnchor.constraint(equalTo: leadingAnchor),
            galleryView.trailingAnchor.constraint(equalTo: trailingAnchor),
            galleryView.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: Margins.lg),
            galleryView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
