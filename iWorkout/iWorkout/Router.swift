//
//  Router.swift
//  iWorkout
//
//  Created by Shmatov Nikita on 21.03.2021.
//  Copyright © 2021 Nikendo. All rights reserved.
//

import UIKit


protocol RouterMain {
    var navigationController: UINavigationController? { get set }
    var assemblyBuilder: AssemblyBuilderProtocol? { get set }
}


protocol RouterProtocol: RouterMain {
    func initialViewController()
    func popToRoot()
}


class Router: RouterProtocol {
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func popToRoot() {
        navigationController?.popToRootViewController(animated: true)
    }
}

