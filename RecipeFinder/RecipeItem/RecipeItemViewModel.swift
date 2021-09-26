//
//  RecipeItemViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation
import Combine

class RecipeItemViewModel: ObservableObject, Identifiable {
    let recipeId: Int
    let title: String
    let image: String
    
    init(id: Int, title: String, image: String) {
        self.recipeId = id
        self.title = title
        self.image = image
    }
}
