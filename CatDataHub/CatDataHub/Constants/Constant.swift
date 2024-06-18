//
//  Constant.swift
//  CatDataHub
//
//  Created by Payal Porwal on 14/06/24.
//

import Foundation

enum Constant {
    enum ProducTableView {
        static let nibName = "ProductListTableViewCell"
        static let cellIdentifier = "ProductListTableViewCell"
    }
    
    enum ProductDetailView {
        static let controllerIdentifier = "productDetailsViewController"
        static let description = "Description"
        static let temperament = "Temperament"
        static let lifeSpan = "LifeSpan"
    }
    
    enum ProductListTableViewCell {
        static let breed = "Breed"
        static let starFill = "star.fill"
        static let star = "star"
    }
}
