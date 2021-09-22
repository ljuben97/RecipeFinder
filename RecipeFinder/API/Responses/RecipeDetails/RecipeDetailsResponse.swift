//
//  RecipeDetailsResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

struct RecipeDetailsResponse: Decodable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
    let servings: Int
    let readyInMinutes: Int
    let license: String?
    let sourceName: String
    let sourceUrl: String
    let spoonacularSourceUrl: String
    let aggregateLikes: Int
    let healthScore: Double
    let spoonacularScore: Double
    let pricePerServing: Double
    let analyzedInstructions: [AnalyzedInstructionResponse]
    let cheap: Bool
    let creditsText: String
    let cuisines: [String]
    let dairyFree: Bool
    let diets: [String]
    let gaps: String
    let glutenFree: Bool
    let instructions: String?
    let ketogenic: Bool?
    let lowFodmap: Bool
    let occasions: [String]
    let sustainable: Bool
    let vegan: Bool
    let vegetarian: Bool
    let veryHealthy: Bool
    let veryPopular: Bool
    let whole30: Bool?
    let weightWatcherSmartPoints: Int
    let dishTypes: [String]
    let summary: String
    let extendedIngredients: [ExtendedIngredientResponse]
    let winePairing: WinePairingResponse
    let originalId: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case image
        case imageType
        case servings
        case readyInMinutes
        case license
        case sourceName
        case sourceUrl
        case spoonacularSourceUrl
        case aggregateLikes
        case healthScore
        case spoonacularScore
        case pricePerServing
        case analyzedInstructions
        case cheap
        case creditsText
        case cuisines
        case dairyFree
        case diets
        case gaps
        case glutenFree
        case instructions
        case ketogenic
        case lowFodmap
        case occasions
        case sustainable
        case vegan
        case vegetarian
        case veryHealthy
        case veryPopular
        case whole30
        case weightWatcherSmartPoints
        case dishTypes
        case summary
        case extendedIngredients
        case winePairing
        case originalId
    }
}
