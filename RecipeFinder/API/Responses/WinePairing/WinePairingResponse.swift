//
//  WinePairingResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

struct WinePairingResponse: Decodable {
    let pairedWines: [String]?
    let pairingText: String?
    let productMatches: [MatchedProductResponse]?
    
    enum CodingKeys: String, CodingKey {
        case pairedWines
        case pairingText
        case productMatches
    }
}
