//
//  ProductListTableViewCell.swift
//  CatDataHub
//
//  Created by Payal Porwal on 14/06/24.
//

import UIKit

protocol favoriteProtocol: AnyObject {
    func saveFavorite(id: String?)
}


class ProductListTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var breedNameLabel: UILabel!
    @IBOutlet weak var originNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var delegate : favoriteProtocol?
    var product: Product? {
        didSet {
            productDetailsConfiguration()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initSetupUI()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func initSetupUI() {
        productBackgroundView.clipsToBounds = true
        productBackgroundView.layer.cornerRadius = 15
        productImageView.layer.cornerRadius = 10
        self.productBackgroundView.backgroundColor = .systemGray6
        FavoritesManager.shared.loadFavorites()
    }
    
    // MARK: - productDetailsConfiguration
    /**
     - description: - It will set the cell UIelements data.
     - Parameters:
     - selectedContact: selected contact form the all contacts.
     */
    func productDetailsConfiguration() {
        guard let product else { return }
        if let breedDetails = product.breeds, !breedDetails.isEmpty {
            if let breedname = breedDetails.first?.name {
                breedNameLabel.text = "\(Constant.ProductListTableViewCell.breed): \(breedname)"
            }
            originNameLabel.text = breedDetails.first?.origin
        }
        productImageView.setImage(with: product.url ?? "")
        if let id = product.id {
            if FavoritesManager.shared.isFavorite(id: id) {
             favoriteButton.setProductAsFavorite(isFavourite: true)
            } else {
                favoriteButton.setProductAsFavorite(isFavourite: false)

            }
        }
    }
    
    // MARK: - Favorite Button action

    @IBAction func actionOnFavoriteButton(_ sender: Any) {
        guard let product else { return }
        favoriteButton.setProductAsFavorite(isFavourite: true)
        delegate?.saveFavorite(id: product.id)
    }
}


