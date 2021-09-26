//
//  SearchRecipesView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 18.7.21.
//

import SwiftUI

struct SearchRecipesView: View {
    @ObservedObject var viewModel: SearchRecipesViewModel
    
    var body: some View {
        contentView
    }
}

extension SearchRecipesView {
    private var contentView: some View {
        ZStack(alignment: .bottom) {
            VStack(spacing: 30) {
                enterIngredientsView
                ingredientsView
                Group {
                    switch viewModel.state {
                    case .error:
                        errorView
                    case .empty:
                        emptyView
                    case .initial:
                        initialView
                    case .success:
                        successView
                    case .loading:
                        loadingView
                    }
                }
                Spacer()
            }
            favoriteRecipesButtonView
        }
    }
    
    private var favoriteRecipesButtonView: some View {
        Button(action: viewModel.onFavoriteRecipesButtonTap) {
            HStack(alignment: .center) {
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                Text("Favorites")
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.size.width)
            .foregroundColor(.gray)
            .overlay(Rectangle().frame(width: nil, height: 1, alignment: .top).foregroundColor(Color.black), alignment: .top)
        }
    }
    
    private var ingredientsView: some View {
        HStack(spacing: 5) {
            ForEach(viewModel.ingredients) { ingredient in
                Text(ingredient.name)
            }
        }
    }
    
    private var enterIngredientsView: some View {
        HStack {
            TextField("Enter an ingredient", text: $viewModel.ingredientText)
            Button(action: viewModel.addIngredient) {
                Text("Add ingredient")
            }
            Button(action: viewModel.searchRecipes) {
                Text("Search")
            }
            .disabled(viewModel.ingredients.isEmpty)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
    
    private var successView: some View {
        VStack(alignment: .leading) {
            ForEach(viewModel.recipes) { recipe in
                Button(action: { viewModel.onRecipeItemTap(recipe: recipe) }) {
                    RecipeItemView(viewModel: recipe)
                }
            }
        }
    }
    
    private var errorView: some View {
        FullScreenErrorView(title: "Error",
                            description: viewModel.errorMessage,
                            buttonText: "Retry",
                            errorCode: 404,
                            onButtonTap: viewModel.retry)
    }
    
    private var emptyView: some View {
        EmptyView()
    }
    
    private var initialView: some View {
        VStack(alignment: .center) {
            
        }
    }
    
    private var loadingView: some View {
        VStack {
            Spacer()
            ProgressView()
            Spacer()
        }
    }
}
