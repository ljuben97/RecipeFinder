//
//  MissingIngredientsViewModel.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation

class MissingIngredientsViewModel {
    let id: Int
    let name: String
    let image: String
    
    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
