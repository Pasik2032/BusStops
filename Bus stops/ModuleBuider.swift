//
//  ModuleBuider.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation
import UIKit

protocol Builder {
    static func createMain() -> UIViewController
    static func createStop(stop: BusStop?) -> UIViewController
}

class ModuleBuider: Builder{
    static func createMain() -> UIViewController {
        let view = MainView()
        let networkService = NetworkService()
         let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    static func createStop(stop: BusStop?) -> UIViewController {
        let view = StopView()
        let networkService = NetworkService()
         let presenter = StopPresenter(view: view, networkService: networkService, stop: stop)
        view.presenter = presenter
        return view
    }
}
