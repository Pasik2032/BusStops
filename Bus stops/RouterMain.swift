//
//  RouterMain.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import UIKit

// MARK: - Protocol Router Structure
protocol RouterMain {
    var navigationController: UINavigationController?{get set}
    var assemblyBuilder: BuilderProtocol?{get set}
    static var currentStop: BusStop?{get set}
}

// MARK: - Creating a Controller
protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showMain()
    func showStop(stop: BusStop?)
}

class Router: RouterProtocol {
    //MARK: - Router Structure
    
    var navigationController: UINavigationController?
    var assemblyBuilder: BuilderProtocol?
    static var currentStop: BusStop?
    
    init(navigationController: UINavigationController, assemblyBuilder: BuilderProtocol ) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    // MARK: - Initializing the controller.
    func initialViewController() {
        showMain()
        // Checking what was opened when closing.
        if UserDefaults.standard.bool(forKey: "OpenStop")  {
            // Attempt to restore the StopView controller
            if let name = UserDefaults.standard.string(forKey: "currentStopName"),
               let id = UserDefaults.standard.string(forKey: "currentStopId") {
                let lat = UserDefaults.standard.float(forKey: "currentStopLat")
                let lon = UserDefaults.standard.float(forKey: "currentStopLon")
                let stop = BusStop(name: name, id: id, lat: lat, lon: lon)
                showStop(stop: stop)
            }
        }
    }
    
    // MARK: - Show the main view controller
    func showMain() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMain(router: self) else {return}
            navigationController.viewControllers = [mainViewController]
        }
    }
    
    // MARK: - Show the stop view controller
    func showStop(stop: BusStop?) {
        if let navigationController = navigationController {
            guard let stopViewController = assemblyBuilder?.createStop(router: self, stop: stop) else {return}
            Router.currentStop = stop
            navigationController.pushViewController(stopViewController, animated: true)
        }
    }
}
