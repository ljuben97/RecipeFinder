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
        ProgressView()
            .frame(width: 120, height: 120)
    }
    
    private var errorView: some View {
        FullScreenErrorView(title: "Error",
                            description: viewModel.errorMessage,
                            buttonText: "Rertry",
                            errorCode: 404,
                            onButtonTap: viewModel.retryFunction)
    }
    
    private var successView: some View {
        ZStack(alignment: .bottom) {
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
                            if !viewModel.isOffline {
                                heartButtonView
                            }
                        }
                        Text(viewModel.ingredients)
                            .font(.body)
                            .foregroundColor(.black)
                            .lineLimit(100)
                        instructionsView
                        if !viewModel.isOffline {
                            CheckmarkOrXView(isTrue: viewModel.cheap, text: "Cheap")
                            CheckmarkOrXView(isTrue: viewModel.vegetarian, text: "Vegeterian")
                            CheckmarkOrXView(isTrue: viewModel.vegan, text: "Vegan")
                            CheckmarkOrXView(isTrue: viewModel.dairyFree, text: "Dairy Free")
                            CheckmarkOrXView(isTrue: viewModel.glutenFree, text: "Glutten Free")
                            CheckmarkOrXView(isTrue: viewModel.veryPopular, text: "Very Popular")
                        }
                    }
                    .padding(.horizontal, 8)
                }
            }
            if viewModel.isOffline {
                Button(action: viewModel.onRemoveFromStoreButtonTap) {
                    Text("Remove From Favorites")
                        .font(.title2)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                }
                .frame(width: 150)
                .padding(8)
                .foregroundColor(.gray)
                .background(RoundedRectangle(cornerRadius: 25).fill(Color.yellow))
                .overlay(RoundedRectangle(cornerRadius: 25).stroke(Color.black, lineWidth: 1))
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
