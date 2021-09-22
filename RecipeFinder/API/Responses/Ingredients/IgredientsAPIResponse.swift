//
//  IgredientsAPIResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 23.7.21.
//

import Foundation

struct IngredietnsAPIResponse: Decodable {
    let aisle: String
    let amount: Double
    let id: Int
    let name: String
    let image: String
    let metaInformation: [String]
    let meta: [String]
    let original: String
    let originalString: String
    let originalName: String
    let unit: String
    let unitLong: String
    let unitShort: String
    let extendedName: String?
    
    enum CodingKeys: String, CodingKey {
        case aisle
        case amount
        case id
        case name
        case image
        case metaInformation
        case meta
        case original
        case originalString
        case originalName
        case unit
        case unitLong
        case unitShort
        case extendedName
    }
}
