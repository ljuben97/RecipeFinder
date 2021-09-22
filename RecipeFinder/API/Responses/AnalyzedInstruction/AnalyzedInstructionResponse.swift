//
//  AnalyzedInstruction.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import Foundation

struct AnalyzedInstructionResponse: Decodable {
    let name: String
    let steps: [StepResponse]
    
    enum CodingKeys: String, CodingKey {
        case name
        case steps
    }
}

