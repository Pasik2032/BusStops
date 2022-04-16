//
//  MainPresenter.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation

protocol MainViewProtocol: class {
    func succes()
    func failer(error: Error)
}

protocol MainViewPresenterProtocol: class{
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol)
    func getStops()
    var stops: [BusStop]? {get set}
    func tobOnTheStop(stop: BusStop?)
}

class MainPresenter: MainViewPresenterProtocol {
    weak var view: MainViewProtocol?
    let networkService: NetworkServiceProtocol!
    var stops: [BusStop]?
    var router: RouterProtocol?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: RouterProtocol) {
        self.view = view
        self.networkService = networkService
        self.router = router
        getStops()
    }
    
    func tobOnTheStop(stop: BusStop?) {
        router?.showStop(stop: stop)
    }
    
    func getStops() {
        networkService.getStops { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let stops):
                    self.stops = stops
                    self.view?.succes()
                case .failure(let error):
                    print("errr")
                    self.view?.failer(error: error)
                }
            }
        }
    }
}
