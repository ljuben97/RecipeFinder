//
//  RecipeItemView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import SwiftUI

struct RecipeItemView: View {
    @ObservedObject var viewModel: RecipeItemViewModel
    
    var body: some View {
        contentView
    }
}

extension RecipeItemView {
    var contentView: some View {
        HStack {
            CircularImageIcon(withURL: viewModel.image)
            Text(viewModel.title)
        }
    }
}
