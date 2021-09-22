//
//  RecipesStore.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 8.9.21.
//

import Foundation

class RecipesStore {
    let key: String = "StoredRecipes"
    let userDefaults: UserDefaults = .standard
    let encoder: JSONEncoder = JSONEncoder()
    let decoder: JSONDecoder = JSONDecoder()
    var recipes: [StoredRecipe] {
        get {
            guard let recipesData = userDefaults.object(forKey: key) as! Data? else { return [] }
            
            return try! decoder.decode([StoredRecipe].self, from: recipesData)
        }
        set {
            let storedRecipes = try! encoder.encode(newValue)
            
            userDefaults.setValue(storedRecipes, forKey: key)
        }
    }
}
