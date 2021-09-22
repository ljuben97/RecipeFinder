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
        // Za Shekio
        EmptyView()
    }
}
