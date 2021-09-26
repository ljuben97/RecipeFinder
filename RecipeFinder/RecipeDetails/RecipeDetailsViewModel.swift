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
    @Published var ingredients: String = ""
    @Published var isAddedToFavorites: Bool
    @Published var errorMessage: String = ""
    
    let type: RecipeDetailsType
    let service: RecipeDetailsServiceProtocol?
    let recipesStoreManager: RecipesStoreManagerProtocol
    let id: Int
    var disposables = Set<AnyCancellable>()
    
    var sortedSteps: [RecipeStepViewModel] {
        recipeSteps.sorted { $0.number < $1.number }
    }
    
    var hasSteps: Bool {
        recipeSteps.notEmpty
    }
    
    var isOffline: Bool {
        type == .offline
    }
    
    var retryFunction: () -> Void {
        isOffline ? retryMap : retryFetch
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
        isOffline ? mapOffline() : fetchDetails()
    }
    
    func onHeartButtonTap() {
        if isAddedToFavorites {
            recipesStoreManager.removeRecipe(id: id)
        } else {
            recipesStoreManager.addRecipe(recipe: self)
        }
        isAddedToFavorites = !isAddedToFavorites
    }
    
    private func retryFetch() {
        fetchDetails()
    }
    
    private func retryMap() {
        mapOffline()
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
    
    private func mapOffline() {
        guard let storedRecipe = recipesStoreManager.findById(id: id) else {
            errorMessage = "The recipe was not found in your stored recipes. Please try again."
            state = .error
            return
        }
        
        title = storedRecipe.name
        instructions = storedRecipe.instructions
        ingredients = storedRecipe.ingredients.map { $0 }.joined(separator: ", ")
        imageLink = storedRecipe.imageLink
        state = .success
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
        let ingredients = recipe.extendedIngredients.map { ExtendedIngredientViewModel(name: $0.name,
                                                                                   image: $0.image,
                                                                                   amount: $0.measures.metric.amount,
                                                                                   units: $0.measures.metric.unitShort) }
        self.ingredients = ingredients.map { $0.nameAndAmountText }.joined(separator: ", ")
        instructions = recipe.instructions ?? ""
        state = .success
    }
}
