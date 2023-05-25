//
//  FavoritesManager.swift
//  GameStream
//
//  Created by user239477 on 5/24/23.
//

import Foundation

class FavoritesManager: ObservableObject {
    
    @Published var favorites: [String] = UserDefaults.standard.array(forKey: "favorites") as? [String] ?? []

    func addFavorite(gameTitle: String) {
        
        favorites.append(gameTitle)
        
        UserDefaults.standard.set(favorites, forKey: "favorites")
        
    }

    func removeFavorite(gameTitle: String) {
        
        favorites.removeAll(where: { $0 == gameTitle })
        
        UserDefaults.standard.set(favorites, forKey: "favorites")
        
    }

    func isFavorite(gameTitle: String) -> Bool {
        
        return favorites.contains(gameTitle)
        
    }
}
