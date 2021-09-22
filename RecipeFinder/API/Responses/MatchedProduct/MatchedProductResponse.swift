//
//  MatchedProductResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 27.8.21.
//

import Foundation

struct MatchedProductResponse: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let imageUrl: String
    let averageRating: Double
    let ratingCount: Double
    let score: Double
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case price
        case imageUrl
        case averageRating
        case ratingCount
        case score
        case link
    }
}
