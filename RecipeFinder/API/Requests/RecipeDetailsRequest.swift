//
//  RecipeDetailsRequest.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

class RecipeDetailsRequest: BaseRequestProtocol {
    let path: String
    let queryItems: [String : Any]
    
    init(id: Int, includeNutrition: Bool) {
        path = "/recipes/\(id)/information"
        queryItems = ["includeNutrition": includeNutrition, "apiKey": APIConfig.apiKey]
    }
}
