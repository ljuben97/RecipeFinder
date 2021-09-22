//
//  RecipesByIngredientsAPIRequest.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation
import Combine

class RecipesByIngredientsAPIRequest: BaseRequestProtocol {
    let path: String = "/recipes/findByIngredients"
    let queryItems: [String: Any]
    
    init(ingredients: String) {
        queryItems = ["ingredients": ingredients, "apiKey": APIConfig.apiKey]
    }
}
