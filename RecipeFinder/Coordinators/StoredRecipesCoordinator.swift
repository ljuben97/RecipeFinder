//
//  StoredRecipesCoordinator.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 22.9.21.
//

import Foundation

class StoredRecipesCoordinator: BaseCoordinator {
    override func start() {
        let viewModel = StoredRecipesViewModel()
        
        addSubscriber(viewModel.onRecipeItemTapSubject.sink { [weak self] recipeId in
            self?.showRecipeDetails(recipeId: recipeId)
        })
        
        present(view: StoredRecipesView(viewModel: viewModel))
    }
    
    private func showRecipeDetails(recipeId: Int) {
        let viewModel = RecipeDetailsViewModel(type: .offline, id: recipeId)
        
        present(view: RecipeDetailsView(viewModel: viewModel))
    }
}
