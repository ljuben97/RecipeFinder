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
    private var storedRecipesView: some View {
        Group {
            switch viewModel.state {
            case .success:
                successView
            case .empty:
                emptyView
            }
        }
    }
    
    private var successView: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.storedRecipes) { recipe in
                    Button(action: { viewModel.onRecipeItemTap(recipe: recipe) }) {
                        RecipeItemView(viewModel: recipe)
                    }
                }
                Spacer()
            }
        }
    }
    
    private var emptyView: some View {
        FullScreenEmptyView(title: "No Recipes Found.",
                            description: "It appears you do not have any stored recipes. Please add some and then come back!")
    }
}
