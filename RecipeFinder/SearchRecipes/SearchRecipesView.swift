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
                if viewModel.ingredients.notEmpty {
                    ingredientsView
                }
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
                    .font(.title2)
                    .foregroundColor(.black)
                Spacer()
            }
            .frame(width: 150)
            .padding(8)
            .foregroundColor(.gray)
            .background(RoundedRectangle(cornerRadius: 25).fill(Color.yellow))
            .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
        }
    }
    
    private var ingredientsView: some View {
        HStack(spacing: 5) {
            ForEach(viewModel.ingredients) { ingredient in
                HStack(alignment: .center) {
                    Text(ingredient.name)
                        .font(.body)
                        .foregroundColor(.black)
                    Button(action: { viewModel.removeIngredient(ingredient: ingredient) }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
                .padding(8)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.yellow))
            }
        }
    }
    
    private var enterIngredientsView: some View {
        HStack {
            TextField("Enter an ingredient", text: $viewModel.ingredientText)
            Button(action: viewModel.addIngredient) {
                Text("Add Ingredient")
                    .font(.body)
                    .padding(8)
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.green))
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
            }
            Button(action: viewModel.searchRecipes) {
                Text("Search")
                    .font(.body)
                    .padding(8)
                    .foregroundColor(.black)
                    .background(RoundedRectangle(cornerRadius: 25).fill(Color.green))
                    .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
            }
            .disabled(viewModel.ingredients.isEmpty)
        }
        .padding(.horizontal, 20)
        .padding(.top, 10)
    }
    
    private var successView: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(viewModel.recipes) { recipe in
                    Button(action: { viewModel.onRecipeItemTap(recipe: recipe) }) {
                        RecipeItemView(viewModel: recipe)
                    }
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
        FullScreenEmptyView(title: "No Recipes Found!", description: "We didn't find any recipes with those ingredients. Please try again with different ingredients.")
    }
    
    private var initialView: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Image(systemName: "sun.max.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.yellow)
            Text("Welcome To The Recipe Finder!")
                .foregroundColor(.black)
                .font(.title)
                .multilineTextAlignment(.center)
            Text("Please start by searching for some recipes bu adding ingredients. Or you can see all your favorite recipes by clicking the favorites button.")
                .foregroundColor(.black)
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(24)
    }
    
    private var loadingView: some View {
        VStack(alignment: .center) {
            Spacer()
            ProgressView()
                .frame(width: 120, height: 120)
            Spacer()
        }
    }
}
