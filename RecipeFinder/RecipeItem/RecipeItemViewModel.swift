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
    let likes: Int
    let missingIngreditens: [MissingIngredientsViewModel]
    
    init(id: Int, title: String, image: String, likes: Int, missingIngreditens: [MissingIngredientsViewModel]) {
        self.recipeId = id
        self.title = title
        self.image = image
        self.likes = likes
        self.missingIngreditens = missingIngreditens
    }
}
