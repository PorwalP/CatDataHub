//
//  ProductViewModel.swift
//  CatDataHub
//
//  Created by Payal Porwal on 14/06/24.
//

import Foundation


final class ProductViewModel {
    var product: [Product] = []
    var eventHandler: ((_ event: Event) -> Void)?
    
    func fetchProducts() {
        self.eventHandler?(.dataLoading)
        APIManager.shared.request(modelType: [Product].self, type: endPointItems.product) { [weak self] response, error in
            guard let self else { return }
            self.eventHandler?(.stopLoading)
            if let response = response, !response.isEmpty {
                self.product = response.filter {!($0.breeds?.isEmpty ?? true)}
                self.eventHandler?(.dataLoaded)
            } else {
                self.eventHandler?(.error(error))
            }
            
        }
    }
}

extension ProductViewModel {
    enum Event {
        case dataLoading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}
