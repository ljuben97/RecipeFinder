//
//  Ingredient.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 23.7.21.
//

import Foundation

class Ingredient: Identifiable, Equatable {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    static func == (lhs: Ingredient, rhs: Ingredient) -> Bool {
        lhs.name == rhs.name
    }
}
