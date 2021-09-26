//
//  RecipesStore.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 8.9.21.
//

import Foundation

protocol RecipesStoreManagerProtocol {
    var recipes: [StoredRecipe] { get }
    
    func addRecipe(recipe: RecipeDetailsViewModel)
    func containsRecipe(id: Int) -> Bool
    func removeRecipe(id: Int)
    func findById(id: Int) -> StoredRecipe?
}

class RecipesStoreManager: RecipesStoreManagerProtocol {
    let recipesStore: RecipesStore
    
    var recipes: [StoredRecipe] {
        recipesStore.recipes
    }
    
    static var shared: RecipesStoreManagerProtocol {
        RecipesStoreManager()
    }
    
    init(recipesStore: RecipesStore = RecipesStore()) {
        self.recipesStore = recipesStore
    }
    
    func addRecipe(recipe: RecipeDetailsViewModel) {
        let storedRecipe = StoredRecipe(id: recipe.id,
                                        name: recipe.title,
                                        imageLink: recipe.imageLink,
                                        ingredients: recipe.ingredients.map { $0.nameAndAmountText },
                                        instructions: recipe.sortedSteps.map { $0.step }.joined(separator: ". "))
        var storedRecipes = recipesStore.recipes
        storedRecipes.append(storedRecipe)
        recipesStore.recipes = storedRecipes
    }
    
    func containsRecipe(id: Int) -> Bool {
        let storedRecipes = recipesStore.recipes
        
        return storedRecipes.contains { $0.id == id }
    }
    
    func removeRecipe(id: Int) {
        var storedRecipes = recipesStore.recipes
                
        guard let recipe = storedRecipes.first(where: { $0.id == id }) else { return }
        
        storedRecipes.removeAll { $0 == recipe }
        recipesStore.recipes = storedRecipes
    }
    
    func findById(id: Int) -> StoredRecipe? {
        let storedRecipes = recipesStore.recipes
        
        return storedRecipes.first { $0.id == id }
    }
}
