//
//  SearchRecipesCoordinator.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import Foundation

class SearchRecipesCoordinator: BaseCoordinator {
    override func start() {
        let viewModel = SearchRecipesViewModel()
        
        addSubscriber(viewModel.onRecipeTapSubject.sink { [weak self] recipeId in
            self?.showRecipeDetails(recipeId: recipeId)
        })
        
        addSubscriber(viewModel.onFavoriteRecipesButtonTapSubject.sink { [weak self] _ in
            self?.showFavorites()
        })
        
        push(view: SearchRecipesView(viewModel: viewModel))
    }
    
    private func showRecipeDetails(recipeId: Int) {
        let viewModel = RecipeDetailsViewModel(type: .fetch, id: recipeId, service: RecipeDetailsService())
        
        present(view: RecipeDetailsView(viewModel: viewModel))
    }
    
    private func showFavorites() {
        let coordinator = StoredRecipesCoordinator(withParent: self)
        
        addAsChildAndStart(coordinator: coordinator)
    }
}
