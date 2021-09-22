//
//  View.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import Foundation
import SwiftUI

extension View {
    func toHostingController(supportedOrientation: UIInterfaceOrientationMask = .portrait) -> BaseHostingController<Self> {
        return BaseHostingController(rootView: self, supportedOrientation: supportedOrientation)
    }
}
