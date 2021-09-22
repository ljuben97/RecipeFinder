//
//  BaseNavigationController.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import Foundation
import Combine
import SwiftUI

class BaseNavigationController: UINavigationController {
    func push<Content: View>(view: Content, animated: Bool = true) {
        let hostingController = view.toHostingController()
        push(viewController: hostingController, animated: animated)
    }
    
    func push(viewController: UIViewController, animated: Bool = true) {
        if viewControllers.count > 0 {
            pushViewController(viewController, animated: animated)
        } else {
            viewControllers = [viewController]
        }
    }
    
    func present<Content: View>(view: Content, animated: Bool = true) {
        let viewController = view.toHostingController()
        present(viewController: viewController, animated: animated)
    }
    
    func present(viewController: UIViewController, animated: Bool = true) {
        viewController.modalPresentationStyle = .automatic
        viewController.view.backgroundColor = .white
        var topPresentedViewController = presentedViewController
        while topPresentedViewController?.presentedViewController != nil {
            topPresentedViewController = topPresentedViewController?.presentedViewController
        }
        
        if let presentedViewController = topPresentedViewController {
            presentedViewController.present(viewController, animated: animated, completion: nil)
        } else {
            present(viewController, animated: animated, completion: nil)
        }
    }
}
