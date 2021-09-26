//
//  FullScreenErrorView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 26.9.21.
//

import SwiftUI

struct FullScreenErrorView: View {
    let title: String
    let description: String
    let buttonText: String
    let errorCode: Int
    let onButtonTap: () -> Void
    
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Spacer()
            Image(systemName: "exclamationmark.circle")
                .resizable()
                .frame(width: 120, height: 120)
                .foregroundColor(.gray)
            Text(title)
                .foregroundColor(.black)
                .font(.title3)
                .multilineTextAlignment(.center)
            Text("\(errorCode)")
                .foregroundColor(.black)
                .font(.body)
            Text(description)
                .foregroundColor(.black)
                .font(.body)
                .multilineTextAlignment(.center)
            Button(action: onButtonTap) {
                Text(buttonText)
                    .frame(minWidth: 0, maxWidth: 120)
                    .font(.body)
                    .padding()
                    .foregroundColor(.black)
                    .overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .stroke(Color.gray, lineWidth: 2)
                            .foregroundColor(.gray)
                    )
            }
            Spacer()
        }
        .padding(24)
    }
}
