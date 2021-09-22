//
//  StoredRecipesView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 22.9.21.
//

import SwiftUI

struct StoredRecipesView: View {
    @ObservedObject var viewModel: StoredRecipesViewModel
    
    var body: some View {
        storedRecipesView
    }
}

extension StoredRecipesView {
    var storedRecipesView: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.recipes) { recipe in
                Button(action: { viewModel.onRecipeItemTap(recipe: recipe) }) {
                    RecipeItemView(viewModel: recipe)
                }
            }
            Spacer()
        }
    }
}
