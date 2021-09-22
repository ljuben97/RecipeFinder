//
//  ExtendedIngredientView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import SwiftUI

struct ExtendedIngredientView: View {
    var viewModel: ExtendedIngredientViewModel
    
    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            SmallCircularImageIcon(withURL: viewModel.image)
            Text(viewModel.nameAndAmountText)
                .font(.body)
                .foregroundColor(.black)
        }
    }
}
