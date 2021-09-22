//
//  StoredRecipesViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 22.9.21.
//

import Foundation
import Combine

class StoredRecipesViewModel: ObservableObject {
    // Za Shekio
    let recipesStoreManager: RecipesStoreManagerProtocol
    let onRecipeItemTapSubject: PassthroughSubject<Int, Never> = PassthroughSubject<Int, Never>()
    
    init(recipesStoreManager: RecipesStoreManagerProtocol = RecipesStoreManager() ) {
        self.recipesStoreManager = recipesStoreManager
    }
    
    func onRecipeItemTap(recipe: RecipeItemViewModel) {
        onRecipeItemTapSubject.send(recipe.recipeId)
    }
}
