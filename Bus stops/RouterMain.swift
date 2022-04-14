//
//  RouterMain.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import UIKit

protocol RouterMain {
    var navigationController: UINavigationController?{get set}
    var assemblyBuilder: BuilderProtocol?{get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showStop(stop: BusStop?)
    func popToRoot()
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: BuilderProtocol ) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMain(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    func showStop(stop: BusStop?) {
        if let navigationController = navigationController {
            guard let stopViewController = assemblyBuilder?.createStop(router: self, stop: stop) else {return}
            navigationController.pushViewController(stopViewController, animated: true)
        }
    }
    
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }

    
    
}
