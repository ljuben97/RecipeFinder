//
//  String.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation

extension String {
    var notEmpty: Bool {
        !self.isEmpty
    }
    
    mutating func empty() {
        self = ""
    }
}
