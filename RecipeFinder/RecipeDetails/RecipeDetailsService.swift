//
//  RecipeDetailsService.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation
import Combine

protocol RecipeDetailsServiceProtocol {
    func getRecipeDetails(id: Int) -> AnyPublisher<RecipeDetailsResponse, ErrorResponse>
}

class RecipeDetailsService: RecipeDetailsServiceProtocol {
    func getRecipeDetails(id: Int) -> AnyPublisher<RecipeDetailsResponse, ErrorResponse> {
        let request = RecipeDetailsRequest(id: id, includeNutrition: false)
        
        return APIClient.makeRequest(request: request)
    }
}
