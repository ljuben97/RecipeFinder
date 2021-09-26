//
//  StoredRecipesCoordinator.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 22.9.21.
//

import Foundation
import Combine

class StoredRecipesCoordinator: BaseCoordinator {
    override func start() {
        let viewModel = StoredRecipesViewModel()
        
        addSubscriber(viewModel.onRecipeItemTapSubject.sink { [weak self] recipeId in
            self?.showRecipeDetails(recipeId: recipeId,
                                    removeFromStoredRecipesSubject: viewModel.removeFromStoredRecipesSubject)
        })
        
        addSubscriber(viewModel.removeFromStoredRecipesSubject.sink { recipeId in
            viewModel.onReciveRemove(id: recipeId)
        })
        
        present(view: StoredRecipesView(viewModel: viewModel))
    }
    
    private func showRecipeDetails(recipeId: Int,
                                   removeFromStoredRecipesSubject: PassthroughSubject<Int, Never>) {
        let viewModel = RecipeDetailsViewModel(type: .offline, id: recipeId, removeFromStoredRecipesSubject: removeFromStoredRecipesSubject)
        
        present(view: RecipeDetailsView(viewModel: viewModel))
    }
}
