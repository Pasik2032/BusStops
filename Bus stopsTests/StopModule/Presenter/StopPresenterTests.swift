//
//  StopPresenterTests.swift
//  Bus stopsTests
//
//  Created by Даниил Пасилецкий on 17.04.2022.
//

import XCTest
import MapKit
@testable import Bus_stops

class MockStopView: StopViewProtocol {
    func setData(name: String) {
        
    }
    
    func setMap(coordinate: CLLocationCoordinate2D) {
        
    }
    
    func succes() {
        
    }
    
    func configCollectionView() {
        
    }
    
    func noRoutes() {
        
    }
}

class MockStopNetworkService: NetworkServiceProtocol {
    var routes : [RoutePath]!
    init(){}
    
    convenience init(routes : [RoutePath]?){
        self.init()
        self.routes = routes
    }
    func getStops(completion: @escaping (Result<[BusStop]?, Error>) -> Void) {

    }
    
    func getRoutes(id: String, completion: @escaping (Result<[RoutePath]?, Error>) -> Void) {
        if let routes = routes{
            completion(.success(routes))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
    
}

class StopPresenterTests: XCTestCase {

    var view: MockStopView!
    var presenter: StopPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var routes = [RoutePath]()

    override func setUp() {
        let nav = UINavigationController()
        let builder = ModuleBuider()
        router = Router(navigationController: nav, assemblyBuilder: builder)
    }

    override func tearDown() {
        view = nil
        networkService = nil
        presenter = nil
    }
    
    func testGetSuccesStops(){
        let rout = RoutePath(type: "Bar", number: "foo", timeArrival: ["baz"], color: "data", fontColor: "fontcolor")
        let stop = BusStop(name: "Foo", id: "Baz", lat: 0, lon: 1)
        routes.append(rout)
        
        view = MockStopView()
        networkService = MockStopNetworkService(routes: routes)
        presenter = StopPresenter(view: view, networkService: networkService, router: router, stop: stop)
        
        var catchRoutes: [RoutePath]?
        
        networkService.getRoutes(id: "foo") { result in
            switch result {
            case .success(let routs):
                catchRoutes = routs
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchRoutes?.count, 0)
        XCTAssertEqual(catchRoutes?.count, routes.count)
    }


}
