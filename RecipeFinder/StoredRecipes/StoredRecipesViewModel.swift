//
//  StoredRecipesViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 22.9.21.
//

import Foundation
import Combine

class StoredRecipesViewModel: ObservableObject {
    let recipesStoreManager: RecipesStoreManagerProtocol
    let onRecipeItemTapSubject: PassthroughSubject<Int, Never> = PassthroughSubject<Int, Never>()
    
    var recipes: [RecipeItemViewModel] {
        recipesStoreManager.recipes.map { RecipeItemViewModel(id: $0.id,
                                                              title: $0.name,
                                                              image: $0.imageLink,
                                                              likes: 0,
                                                              missingIngreditens: []) }
        

    }
    
    init(recipesStoreManager: RecipesStoreManagerProtocol = RecipesStoreManager() ) {
        self.recipesStoreManager = recipesStoreManager
    }
    
    func onRecipeItemTap(recipe: RecipeItemViewModel) {
        onRecipeItemTapSubject.send(recipe.recipeId)
    }
}
