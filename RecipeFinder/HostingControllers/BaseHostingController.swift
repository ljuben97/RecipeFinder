//
//  BaseHostingController.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import Foundation

import SwiftUI

class BaseHostingController<Content: View>: UIHostingController<Content> {
    var supportedOrientation: UIInterfaceOrientationMask
    
    init(rootView: Content, supportedOrientation: UIInterfaceOrientationMask = .portrait) {
        self.supportedOrientation = supportedOrientation
        super.init(rootView: rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
