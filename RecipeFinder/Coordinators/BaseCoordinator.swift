//
//  BaseCoordinator.swift
//  RecipeFinder
//
//  Created by Ljuben Angelkoski on 28.8.21.
//

import Foundation
import Combine
import SwiftUI

class BaseCoordinator {
    var navigationController: BaseNavigationController!
    weak private(set) var parent: BaseCoordinator?
    private(set) var childCoordinators: [BaseCoordinator] = []
    var cancellables: [AnyCancellable] = []
    private var initialViewIdentifier: String?
    
    var presentingNavigationController: BaseNavigationController {
        return navigationController
    }
    
    init() {
        
    }
    
    init(withParent parent: BaseCoordinator) {
        self.parent = parent
    }
    
    func start() {
        preconditionFailure("This method needs to be overwritten by the subclass")
    }
    
    func addAsChildAndStart(coordinator: BaseCoordinator) {
        addChild(childCoordinator: coordinator)
        coordinator.start()
    }
    
    func remove(childCoordinator: BaseCoordinator) {
        self.childCoordinators.removeAll { $0 === childCoordinator }
    }
    
    func push<Content: View>(view: Content, animated: Bool = true) {
        if navigationController == nil {
            startByPushing(view: view, animated: animated)
        } else {
            navigationController.push(view: view, animated: animated)
        }
    }
    
    func present<Content: View>(view: Content, animated: Bool = true) {
        if navigationController == nil {
            startByPresenting(view: view, animated: animated)
        } else {
            navigationController.present(view: view, animated: animated)
        }
    }
    
    func addSubscriber(_ subject: AnyCancellable) {
        cancellables.append(subject)
    }
    
    func finish() {
        cancellables.forEach { $0.cancel() }
        parent?.remove(childCoordinator: self)
    }
    
    private func startByPushing<Content: View>(view: Content, animated: Bool = true) {
        guard let parent = self.parent else {
            print("No parent is defined for the coordinator")
            return
        }
        navigationController = parent.navigationController
        let rootViewController = view.toHostingController()
        initialViewIdentifier = String(describing: type(of: rootViewController))
        navigationController.pushViewController(rootViewController, animated: animated)
    }
    
    private func startByPresenting<Content: View>(view: Content, animated: Bool = true) {
        guard let parent = self.parent else {
            print("No parent is defined for the coordinator")
            return
        }
        let rootViewController = view.toHostingController()
        initialViewIdentifier = String(describing: type(of: rootViewController))
        navigationController = BaseNavigationController(rootViewController: rootViewController)
        parent.presentingNavigationController.present(viewController: navigationController, animated: animated)
    }
    
    private func addChild(childCoordinator: BaseCoordinator) {
        childCoordinators.append(childCoordinator)
    }
}
