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
    let removeFromStoredRecipesSubject: PassthroughSubject<Int, Never> = PassthroughSubject<Int, Never>()
    @Published var storedRecipes: [RecipeItemViewModel] = []
    
    var state: StoredRecipesState {
        storedRecipes.isEmpty ? .empty : .success
    }
    
    init(recipesStoreManager: RecipesStoreManagerProtocol = RecipesStoreManager() ) {
        self.recipesStoreManager = recipesStoreManager
        storedRecipes = self.recipesStoreManager.recipes.map { RecipeItemViewModel(id: $0.id,
                                                                              title: $0.name,
                                                                              image: $0.imageLink) }
        _ = self.objectWillChange

    }
    
    func onRecipeItemTap(recipe: RecipeItemViewModel) {
        onRecipeItemTapSubject.send(recipe.recipeId)
    }
    
    func onReciveRemove(id: Int) {
        storedRecipes.removeAll { $0.recipeId == id }
        _ = self.objectWillChange
    }
}
