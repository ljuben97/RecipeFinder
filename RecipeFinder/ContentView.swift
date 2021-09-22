//
//  ContentView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 14.7.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SearchRecipesView(viewModel: SearchRecipesViewModel())
    }
}
