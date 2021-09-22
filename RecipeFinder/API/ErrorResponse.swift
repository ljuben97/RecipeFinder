//
//  ErrorResponse.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 17.7.21.
//

import Foundation

enum ErrorResponse: Error {
  case parsing(description: String)
  case network(description: String)
}
