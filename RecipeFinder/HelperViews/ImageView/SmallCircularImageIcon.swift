//
//  ImageView.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 23.7.21.
//

import SwiftUI

struct SmallCircularImageIcon: View {
    @ObservedObject var viewModel: ImageViewModel
    @State var image: UIImage = UIImage()

    init(withURL url: String) {
        viewModel = ImageViewModel(urlString:url)
    }

    var body: some View {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width:20, height:20)
                .clipShape(Circle())
                .onReceive(viewModel.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage()
        }
    }
}
