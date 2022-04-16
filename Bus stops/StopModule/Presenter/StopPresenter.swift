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
    func succes()
    func configCollectionView()
    func noRoutes()
}

protocol StopViewPresenterProtocol: class{
    init(view: StopViewProtocol, networkService: NetworkService, router: RouterProtocol, stop: BusStop?)
    func setStopInfo()
    func getRoutes()
    var routes: [RoutePath]? {get set}
}

class StopPresenter: StopViewPresenterProtocol {
    func getRoutes() {
        networkService.getRoutes(id: stop!.id, completion: { [weak self] result in
            guard let self = self else {return}
            DispatchQueue.main.async {
                switch result {
                case .success(let routes):
                    self.routes = routes
                    if let routes = routes {
                        if !routes.isEmpty{
                            self.view?.configCollectionView()
                            self.view?.succes()
                        } else {
                            self.view?.noRoutes()
                        }
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                    self.view?.noRoutes()
                }
            }
        })
    }
    
    weak var view: StopViewProtocol?
    let networkService: NetworkServiceProtocol!
    var stop: BusStop?
    var routes: [RoutePath]?
    var router: RouterProtocol?
    
    required init(view: StopViewProtocol, networkService: NetworkService, router: RouterProtocol, stop: BusStop?) {
        self.view = view
        self.networkService = networkService
        self.stop = stop
        self.router = router
    }
    
    public func setStopInfo() {
        getRoutes()
        if let stop = stop {
            let coord = CLLocationCoordinate2D(latitude: CLLocationDegrees(stop.lat), longitude: CLLocationDegrees(stop.lon))
            view?.setMap(coordinate: coord)
        }
        view?.setData(name: stop?.name ?? "404")
    }
}

