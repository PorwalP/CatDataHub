//
//  FavoritesManager.swift
//  CatDataHub
//
//  Created by Payal Porwal on 15/06/24.
//

import Foundation

class FavoritesManager {
    
    static let shared = FavoritesManager()
    private init() {}
    
    private var favoritesData: [String] = []
    
    // MARK: - loadFavorites
    /**
     - description: - loadFavorites will load the favourited list array from the userdefaults.
     */
    func loadFavorites() {
        favoritesData = UserDefaults.standard.getFavoriteListData()
        print(favoritesData)
    }
    
    // MARK: - getFavorites
    /**
     - description: - getFavorites will return the favorited list array.
     */
    func getFavorites() -> [String] {
        return favoritesData
    }
    
    // MARK: - addFavorite
    /**
     - description: - addFavorite will add the favourited list array to the userdefaults.
     */
    func addFavorite(productId: String) {
        self.loadFavorites()
        favoritesData.append(productId)
        UserDefaults.standard.setFavoriteListData(favorited: favoritesData)
    }
    
    // MARK: - isFavorite
    /**
     - description: - isFavorite will return the value if the id is the part of favourite list.
     */
    func isFavorite(id: String) -> Bool {
        return favoritesData.contains(id)
    }
}
