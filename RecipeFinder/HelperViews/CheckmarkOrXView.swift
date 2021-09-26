//
//  CheckmarkOrXView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import SwiftUI

struct CheckmarkOrXView: View {
    @State var isTrue: Bool
    let text: String
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(text)
            if isTrue {
                Image(systemName: "checkmark.circle")
                    .foregroundColor(.green)
            } else {
                Image(systemName: "xmark.circle")
                    .foregroundColor(.red)
            }
        }
    }
}
