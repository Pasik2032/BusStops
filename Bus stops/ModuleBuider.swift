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
}

class ModuleBuider: Builder{
    static func createMain() -> UIViewController {
        let view = MainView()
        let networkService = NetworkService()
         let presenter = MainPresenter(view: view, networkService: networkService)
        view.presenter = presenter
        return view
    }
    
    
}
