//
//  FullScreenEmptyView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 26.9.21.
//

import SwiftUI

struct FullScreenEmptyView: View {
    let title: String
    let description: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Image(systemName: "cart.fill")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.blue)
            Text(title)
                .foregroundColor(.black)
                .font(.title3)
                .multilineTextAlignment(.center)
            Text(description)
                .foregroundColor(.black)
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(24)
    }
}
