//
//  Config.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 17.7.21.
//

import Foundation

struct APIConfig {
    static let baseHost = "api.spoonacular.com"
    static let scheme = "https"
    static let apiKey = "116aaab3a14a413cb3ebf13b6df78709"
    static let session: URLSession = .shared
}
