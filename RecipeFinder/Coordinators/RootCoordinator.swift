//
//  RootCoordinator.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import Foundation
import SwiftUI
import UIKit

class RootCoordinator: BaseCoordinator {
    let window: UIWindow
    
    override func start() {
        let searchRecipesCoordinator = SearchRecipesCoordinator(withParent: self)
        addAsChildAndStart(coordinator: searchRecipesCoordinator)
    }
    
    init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
        super.init()
        navigationController = BaseNavigationController()
        navigationController.navigationBar.isHidden = true
        window.rootViewController = navigationController
    }
}
