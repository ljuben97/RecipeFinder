//
//  ImageView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 23.7.21.
//

import SwiftUI

struct CircularImageIcon: View {
    @ObservedObject var viewModel: ImageViewModel
    @State var image: UIImage = UIImage()

    init(withURL url: String) {
        viewModel = ImageViewModel(urlString:url)
    }

    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:40, height:40)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.black, lineWidth: 1))
                .onReceive(viewModel.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
