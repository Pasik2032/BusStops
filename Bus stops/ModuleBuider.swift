//
//  ModuleBuider.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation
import UIKit

protocol BuilderProtocol {
    func createMain(router: RouterProtocol) -> UIViewController
    func createStop(router: RouterProtocol, stop: BusStop?) -> UIViewController
}

class ModuleBuider: BuilderProtocol{
    func createMain(router: RouterProtocol) -> UIViewController {
        let view = MainView()
        let networkService = NetworkService()
        let presenter = MainPresenter(view: view, networkService: networkService, router: router)
        view.presenter = presenter
        return view
    }
    
    func createStop(router: RouterProtocol, stop: BusStop?) -> UIViewController {
        let view = StopView()
        let networkService = NetworkService()
        let presenter = StopPresenter(view: view, networkService: networkService, router: router, stop: stop)
        view.presenter = presenter
        return view
    }
}
