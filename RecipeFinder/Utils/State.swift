//
//  State.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation

enum SectionState {
    case initial
    case success
    case loading
    case empty
    case error
}

enum DetailsState {
    case success
    case loading
    case error
}
