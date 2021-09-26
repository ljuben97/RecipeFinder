//
//  UIApplication.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 26.9.21.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
