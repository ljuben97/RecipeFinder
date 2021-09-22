//
//  StepResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import Foundation


struct StepResponse: Decodable {
    let number: Int
    let step: String
    let ingredients: [StepIngredientResponse]
    let equipment: [StepIngredientResponse]
    
    enum CodingKeys: String, CodingKey {
        case number
        case step
        case ingredients
        case equipment
    }
}
