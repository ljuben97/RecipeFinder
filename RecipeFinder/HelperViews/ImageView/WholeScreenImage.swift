//
//  WholeScreenImageView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 29.8.21.
//

import Foundation
import SwiftUI

struct WholeScreenImage: View {
    @ObservedObject var viewModel: ImageViewModel
    @State var image: UIImage = UIImage()

    init(withURL url: String) {
        viewModel = ImageViewModel(urlString:url)
    }

    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .onReceive(viewModel.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
