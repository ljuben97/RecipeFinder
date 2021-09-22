//
//  RecipeDetailsViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation
import Combine

class RecipeDetailsViewModel: ObservableObject {
    enum RecipeDetailsType {
        case fetch
        case offline
    }
    
    @Published var state: DetailsState = .loading
    @Published var title: String = ""
    @Published var imageLink: String = ""
    @Published var readyInMinutes: Int = 0
    @Published var healthScore: Double = 0
    @Published var cheap: Bool = false
    @Published var glutenFree: Bool = false
    @Published var dairyFree: Bool = false
    @Published var vegetarian: Bool = false
    @Published var vegan: Bool = false
    @Published var veryHealth: Bool = false
    @Published var veryPopular: Bool = false
    @Published var recipeSteps: [RecipeStepViewModel] = []
    @Published var instructions: String = ""
    @Published var ingredients: [ExtendedIngredientViewModel] = []
    @Published var isAddedToFavorites: Bool
    
    let type: RecipeDetailsType
    let service: RecipeDetailsServiceProtocol?
    let recipesStoreManager: RecipesStoreManagerProtocol
    let id: Int
    var disposables = Set<AnyCancellable>()
    
    var sortedSteps: [RecipeStepViewModel] {
        recipeSteps.sorted { $0.number < $1.number }
    }
    
    var ingredientsText: String {
        ingredients.map { $0.nameAndAmountText }.joined(separator: ", ")
    }
    
    var hasSteps: Bool {
        recipeSteps.notEmpty
    }
    
    init(type: RecipeDetailsType,
         id: Int,
         service: RecipeDetailsServiceProtocol? = nil,
         recipesStoreManager: RecipesStoreManagerProtocol = RecipesStoreManager.shared) {
        self.type = type
        self.id = id
        self.service = service
        self.recipesStoreManager = recipesStoreManager
        isAddedToFavorites = recipesStoreManager.containsRecipe(id: id)
    }
    
    func start() {
        switch type {
        case .fetch:
            fetchDetails()
        case .offline:
            mapOffline()
        }
    }
    
    func onHeartButtonTap() {
        if isAddedToFavorites {
            recipesStoreManager.removeRecipe(id: id)
        } else {
            recipesStoreManager.addRecipe(recipe: self)
        }
        isAddedToFavorites = !isAddedToFavorites
    }
    
    private func fetchDetails() {
        state = .loading
        service?
            .getRecipeDetails(id: id)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                switch value {
                case .finished:
                    break
                case let .failure(error):
                    self?.handleError(error: error)
                }
            }, receiveValue: { [weak self]  recipe in
                self?.handleSuccess(recipe: recipe)
            })
            .store(in: &disposables)
    }
    
    // Za Shekio
    private func mapOffline() {
        
    }

    private func handleError(error: ErrorResponse) {
        print(error.localizedDescription)
        state = .error
    }
    
    private func handleSuccess(recipe: RecipeDetailsResponse) {
        imageLink = recipe.image
        title = recipe.title
        readyInMinutes = recipe.readyInMinutes
        healthScore = recipe.healthScore
        cheap = recipe.cheap
        glutenFree = recipe.glutenFree
        dairyFree = recipe.dairyFree
        vegetarian = recipe.vegetarian
        vegan = recipe.vegan
        veryHealth = recipe.veryHealthy
        veryPopular = recipe.veryPopular
        recipeSteps = recipe.analyzedInstructions.first?.steps.map { RecipeStepViewModel(number: $0.number, step: $0.step) } ?? []
        ingredients = recipe.extendedIngredients.map { ExtendedIngredientViewModel(name: $0.name,
                                                                                   image: $0.image,
                                                                                   amount: $0.measures.metric.amount,
                                                                                   units: $0.measures.metric.unitShort) }
        instructions = recipe.instructions ?? ""
        state = .success
    }
}
