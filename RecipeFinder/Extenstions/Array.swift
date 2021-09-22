//
//  Array.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation

extension Array {
    var notEmpty: Bool {
        !self.isEmpty
    }
    
    mutating func empty() {
        self = []
    }
}
