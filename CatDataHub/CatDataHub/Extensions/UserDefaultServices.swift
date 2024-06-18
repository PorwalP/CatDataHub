//
//  UserDefaultServices.swift
//  CatDataHub
//
//  Created by Payal Porwal on 15/06/24.
//

import Foundation

extension UserDefaults {
    
    private static let favoritesKey = "favouriteProducts"
    
    // MARK: - setFavoriteListData
    /**
     - description: - setFavoriteListData is used to save the local data for "favoriteskey" key.
     - Parameters:
     - favourited: data used for the save purpose.
     */
    func setFavoriteListData(favorited: [String]) {
        self.set(favorited, forKey: UserDefaults.favoritesKey)
    }

    // MARK: - getFavoriteListData
    /**
     - description: - getFavoriteListData is used to get the locally saved data for "favoriteskey" key.
     */
    
    func getFavoriteListData() -> [String] {
        return self.array(forKey: UserDefaults.favoritesKey) as? [String] ?? []
    }
    
}
