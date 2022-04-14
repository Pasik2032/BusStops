//
//  StopPresenter.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation

protocol StopViewProtocol: class{
    func setData(name: String)
}

protocol StopViewPresenterProtocol: class{
    init(view: StopViewProtocol, networkService: NetworkService, router: RouterProtocol, stop: BusStop?)
    func setStopInfo()
}

class StopPresenter: StopViewPresenterProtocol {
    weak var view: StopViewProtocol?
    let networkService: NetworkServiceProtocol!
    var stop: BusStop?
    var router: RouterProtocol?
    
    required init(view: StopViewProtocol, networkService: NetworkService, router: RouterProtocol, stop: BusStop?) {
        self.view = view
        self.networkService = networkService
        self.stop = stop
        self.router = router
    }
    
    public func setStopInfo() {
        view?.setData(name: stop?.name ?? "404")
    }
}

