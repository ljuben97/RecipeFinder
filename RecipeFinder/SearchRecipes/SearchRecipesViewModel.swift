//
//  SearchRecipesViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation
import Combine

class SearchRecipesViewModel: ObservableObject {
    @Published var state: SectionState = .initial
    @Published var ingredients: [Ingredient] = []
    @Published var recipes: [RecipeItemViewModel] = []
    var ingredientText: String = ""
    
    let onRecipeTapSubject = PassthroughSubject<Int, Never>()
    let onFavoriteRecipesButtonTapSubject = PassthroughSubject<Void, Never>()
    
    private var disposables: Set<AnyCancellable> = Set<AnyCancellable>()
    private let service: SearchRecipesServiceProtocol
    
    init(service: SearchRecipesServiceProtocol = SearchRecipesService()) {
        self.service = service
    }
    
    func searchRecipes() {
        state = .loading
        fetchRecipesByIngredients()
    }
    
    func addIngredient() {
        guard ingredientText.notEmpty else { return }
        
        ingredients.append(Ingredient(name: ingredientText))
        ingredientText.empty()
    }
    
    func onRecipeItemTap(recipe: RecipeItemViewModel) {
        onRecipeTapSubject.send(recipe.recipeId)
    }
    
    func onFavoriteRecipesButtonTap() {
        onFavoriteRecipesButtonTapSubject.send()
    }
    
    private func fetchRecipesByIngredients() {
        guard ingredients.notEmpty else { return }
        
        service
            .getRecipesByIngredients(ingredients: ingredients.map { $0.name }.joined(separator: ",+"))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                switch value {
                case .finished:
                    break
                case let .failure(error):
                    self?.handleError(error: error)
                }
            },
            receiveValue: { [weak self] result in
                self?.handleSuccess(result: result)
            })
            .store(in: &disposables)
    }
    
    private func handleError(error: ErrorResponse) {
        print(error.localizedDescription)
        state = .error
    }
    
    private func handleSuccess(result: [RecipeByIngredientsAPIResponse]) {
        recipes = result.map { RecipeItemViewModel(id: $0.id,
                                                   title: $0.title,
                                                   image: $0.image,
                                                   likes: $0.likes,
                                                   missingIngreditens: $0
                                                    .missedIngredients
                                                    .map { MissingIngredientsViewModel(id: $0.id,
                                                                                       name: $0.original,
                                                                                       image: $0.image)})}
        ingredients.empty()
        state = .success
    }
}
