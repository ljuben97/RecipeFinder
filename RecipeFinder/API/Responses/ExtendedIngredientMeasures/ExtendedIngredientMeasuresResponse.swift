//
//  ExtendedIngredientMeasuresResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

struct ExtendedIngredientsMeasuresResponse: Decodable {
    let metric: MeasureResponse
    let us: MeasureResponse
    
    enum CodingKeys: String, CodingKey {
        case metric
        case us
    }
}
