//
//  RecipeByIngredientsAPIResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation

struct RecipeByIngredientsAPIResponse: Decodable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
    let likes: Int
    let missedIngredientCount: Int
    let missedIngredients: [IngredietnsAPIResponse]
    let unusedIngredients: [IngredietnsAPIResponse]
    let usedIngredientCount: Int
    let usedIngredients: [IngredietnsAPIResponse]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case imageType
        case likes
        case missedIngredientCount
        case missedIngredients
        case unusedIngredients
        case usedIngredientCount
        case usedIngredients
    }
}
