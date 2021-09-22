//
//  RecipeDetailsView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import SwiftUI

struct RecipeDetailsView: View {
    @ObservedObject var viewModel: RecipeDetailsViewModel
    
    var body: some View {
        contentView
            .onAppear(perform: viewModel.start)
    }
}

extension RecipeDetailsView {
    private var contentView: some View {
        Group {
            switch viewModel.state {
            case .loading:
                loadingView
            case .error:
                errorView
            case .success:
                successView
            }
        }
    }
    
    private var loadingView: some View {
        EmptyView()
    }
    
    private var errorView: some View {
        EmptyView()
    }
    
    private var successView: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                WholeScreenImage(withURL: viewModel.imageLink)
                VStack(alignment: .leading, spacing: 20) {
                    HStack(alignment: .center) {
                        Text(viewModel.title)
                            .bold()
                            .font(.largeTitle)
                            .lineLimit(2)
                        Spacer()
                        heartButtonView
                    }
                    Text(viewModel.ingredientsText)
                        .font(.body)
                        .foregroundColor(.black)
                        .lineLimit(100)
                    instructionsView
                    CheckmarkOrXView(isTrue: viewModel.cheap, text: "Cheap")
                    CheckmarkOrXView(isTrue: viewModel.vegetarian, text: "Vegeterian")
                    CheckmarkOrXView(isTrue: viewModel.vegan, text: "Vegan")
                    CheckmarkOrXView(isTrue: viewModel.dairyFree, text: "Dairy Free")
                    CheckmarkOrXView(isTrue: viewModel.glutenFree, text: "Glutten Free")
                    CheckmarkOrXView(isTrue: viewModel.veryPopular, text: "Very Popular")
                }
                .padding(.horizontal, 8)
            }
        }
    }
    
    private var heartButtonView: some View {
        Button(action: viewModel.onHeartButtonTap) {
            if viewModel.isAddedToFavorites {
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            else {
                Image(systemName: "heart")
                    .foregroundColor(.red)
            }
        }
    }
    
    private var instructionsView: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(viewModel.sortedSteps) { recipeStep in
                RecipeStepView(viewModel: recipeStep)
                    .lineLimit(100)
            }
        }
    }
}
