//
//  StopPresenter.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation
import MapKit

protocol StopViewProtocol: class{
    func setData(name: String)
    func setMap(coordinate: CLLocationCoordinate2D)
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
        if let stop = stop {
            let coord = CLLocationCoordinate2D(latitude: CLLocationDegrees(stop.lat), longitude: CLLocationDegrees(stop.lon))
            view?.setMap(coordinate: coord)
        }
        view?.setData(name: stop?.name ?? "404")
    }
}

