//
//  SearchRecipesService.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation
import Combine

protocol SearchRecipesServiceProtocol {
    func getRecipesByIngredients(ingredients: String) -> AnyPublisher<[RecipeByIngredientsAPIResponse], ErrorResponse>
}

class SearchRecipesService: SearchRecipesServiceProtocol {
    func getRecipesByIngredients(ingredients: String) -> AnyPublisher<[RecipeByIngredientsAPIResponse], ErrorResponse> {
        let request = RecipesByIngredientsAPIRequest(ingredients: ingredients)
        
        return APIClient.makeRequestWithArrayResponse(request: request)
    }
}
