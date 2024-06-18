//
//  ProductDetailsViewController.swift
//  CatDataHub
//
//  Created by Payal Porwal on 15/06/24.
//

import Foundation
import UIKit


class ProductDetailsViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var breedNamelabelText: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var productTemperament: UILabel!
    @IBOutlet weak var prodtuctLifeSpan: UILabel!
    @IBOutlet weak var productBackgroundView: UIView!
    
    var product: Product?

    override func viewDidLoad() {
        super.viewDidLoad()
        initUIConfiguration()
    }
    
    func initUIConfiguration() {
        productBackgroundView.clipsToBounds = true
        productBackgroundView.layer.cornerRadius = 15
        productImageView.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
        self.productDetailsConfiguration()
    }
    
    // MARK: - productDetailsConfiguration
    /**
     - description: - productDetailsConfiguration will set the UI elements data.
     */
    func productDetailsConfiguration() {
        guard let product else { return }
        if let breedDetails = product.breeds, !breedDetails.isEmpty {
            if let breedname = breedDetails.first?.name {
                breedNamelabelText.text = breedname
            }
            productImageView.setImage(with: product.url ?? "")
            productDescription.text = "\(Constant.ProductDetailView.description) : \(breedDetails.first?.description ?? "")"
            productTemperament.text = "\(Constant.ProductDetailView.temperament) :  \(breedDetails.first?.temperament ?? "")"
            prodtuctLifeSpan.text = "\(Constant.ProductDetailView.lifeSpan) : \(breedDetails.first?.lifeSpan ?? "")"
        }
    }
}



