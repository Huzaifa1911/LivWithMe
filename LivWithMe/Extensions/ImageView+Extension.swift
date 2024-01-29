//
//  ImageView+Extension.swift
//  LivWithMe
//
//  Created by Huzaifa Arshad on 16/01/2024.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func setImage(urlString: String?, placeholderImage: UIImage? = nil, downsamplingSize: CGSize? = nil) {
        var options: KingfisherOptionsInfo? = nil
        if let downsamplingSize = downsamplingSize {
            let processor = DownsamplingImageProcessor(size: downsamplingSize)
            options = [.processor(processor)]
        }
        self.kf.setImage(
            with: URL(string: urlString ?? ""),
            placeholder: placeholderImage,
            options: options)
    }
}
