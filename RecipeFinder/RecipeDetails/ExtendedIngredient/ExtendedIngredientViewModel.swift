//
//  ExtendedIngredientViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import Foundation

class ExtendedIngredientViewModel: Identifiable {
    let name: String
    let image: String
    let amount: Double
    let units: String
    
    var nameAndAmountText: String {
        "\(name) \(amount) \(units)"
    }
    
    init(name: String, image: String, amount: Double, units: String) {
        self.name = name
        self.image = image
        self.amount = amount
        self.units = units
    }
}
