//
//  MeasureResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

struct MeasureResponse: Decodable {
    let amount: Double
    let unitLong: String
    let unitShort: String
    
    enum CodingKeys: String, CodingKey {
        case amount
        case unitLong
        case unitShort
    }
}
