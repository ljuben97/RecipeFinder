//
//  RecipeStepView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import SwiftUI

struct RecipeStepView: View {
    var viewModel: RecipeStepViewModel
    
    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Text(viewModel.numberText)
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(100)
            Text(viewModel.step)
                .font(.body)
                .foregroundColor(.black)
                .lineLimit(100)
        }
        .lineLimit(100)
    }
}

