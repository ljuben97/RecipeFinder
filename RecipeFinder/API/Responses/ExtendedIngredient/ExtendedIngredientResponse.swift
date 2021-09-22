//
//  ExtendedIngredient.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

struct ExtendedIngredientResponse: Decodable {
    let aisle: String
    let amount: Double
    let id: Int?
    let consitency: String?
    let name: String
    let image: String
    let meta: [String]
    let original: String
    let originalName: String
    let unit: String
    let measures: ExtendedIngredientsMeasuresResponse
    
    enum CodingKeys: String, CodingKey {
        case aisle
        case amount
        case id
        case consitency
        case name
        case image
        case meta
        case original
        case originalName
        case unit
        case measures
    }
}
