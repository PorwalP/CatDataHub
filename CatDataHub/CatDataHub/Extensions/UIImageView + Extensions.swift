//
//  UIImageView + Extensions.swift
//  CatDataHub
//
//  Created by Payal Porwal on 14/06/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    // MARK: - setImage
    /**
     - description: - SetImage is used to display the image from Image URL
     - Parameters:
     - urlString: as URL key
     */
    func setImage(with urlString: String) {
        guard let url = URL.init(string: urlString) else {
            return
        }
        let resource = KF.ImageResource(downloadURL: url, cacheKey: urlString)
        kf.indicatorType = .activity
        kf.setImage(with: resource)
    }
}
