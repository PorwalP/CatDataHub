//
//  UIButton + Extension.swift
//  CatDataHub
//
//  Created by Payal Porwal on 17/06/24.
//

import UIKit

extension UIButton {
    
    // MARK: - setProductAsFavorite
    /**
     - description: - function will set the button image and forground color
     - Parameters:
     - isFavourite: it is used for check the product is favourtie or not.
     */
    func setProductAsFavorite(isFavourite: Bool) {
        if isFavourite {
            self.setImage(UIImage(systemName: Constant.ProductListTableViewCell.starFill), for: .normal)
            self.configuration?.baseForegroundColor = UIColor.systemYellow
        } else {
            self.setImage(UIImage(systemName: Constant.ProductListTableViewCell.star), for: .normal)
            self.configuration?.baseForegroundColor = UIColor.black
        }
    }
}
