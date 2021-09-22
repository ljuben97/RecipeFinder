//
//  StoredRecipe.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 8.9.21.
//

import Foundation

class StoredRecipe: Codable, Equatable {
    let id: Int
    let name: String
    let imageLink: String
    let ingredients: [String]
    let instructions: String
    
    init(id: Int, name: String, imageLink: String, ingredients: [String], instructions: String) {
        self.id = id
        self.name = name
        self.imageLink = imageLink
        self.ingredients = ingredients
        self.instructions = instructions
    }
    
    static func == (lhs: StoredRecipe, rhs: StoredRecipe) -> Bool {
        return lhs.id == rhs.id
    }
}
