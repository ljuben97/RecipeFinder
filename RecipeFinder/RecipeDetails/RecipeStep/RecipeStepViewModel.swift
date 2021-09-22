//
//  RecipeStepViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import Foundation

class RecipeStepViewModel: Identifiable {
    let number: Int
    let step: String
    
    var numberText: String {
        "\(number)."
    }
    
    init(number: Int, step: String) {
        self.number = number
        self.step = step
    }
}
