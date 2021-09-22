//
//  BaseRequestProtocol.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import Foundation
import Combine

protocol BaseRequestProtocol {
    var path: String { get }
    var queryItems: [String: Any] { get }
}
