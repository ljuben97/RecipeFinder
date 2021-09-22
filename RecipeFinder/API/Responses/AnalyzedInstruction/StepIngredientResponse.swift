//
//  StepIngredientResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import Foundation

struct StepIngredientResponse: Decodable {
    let id: Int
    let name: String
    let localizedName: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case localizedName
        case image
    }
}
