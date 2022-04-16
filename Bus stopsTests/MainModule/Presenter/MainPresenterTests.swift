//
//  MainPresenterTests.swift
//  Bus stopsTests
//
//  Created by Даниил Пасилецкий on 17.04.2022.
//

import XCTest
@testable import Bus_stops

class MockView: MainViewProtocol {
    func succes() {
        print("Good")
    }
    
    func failer(error: Error) {
        print("error")
    }
}

class MockNetworkService: NetworkServiceProtocol {
    var stops : [BusStop]!
    init(){}
    
    convenience init(stops : [BusStop]?){
        self.init()
        self.stops = stops
    }
    func getStops(completion: @escaping (Result<[BusStop]?, Error>) -> Void) {
        if let stops = stops{
            completion(.success(stops))
        } else {
            let error = NSError(domain: "", code: 0, userInfo: nil)
            completion(.failure(error))
        }
    }
    
    func getRoutes(id: String, completion: @escaping (Result<[RoutePath]?, Error>) -> Void) {
        
    }
}

class MainPresenterTests: XCTestCase {
    var view: MockView!
    var presenter: MainPresenter!
    var networkService: NetworkServiceProtocol!
    var router: RouterProtocol!
    var stops = [BusStop]()

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
        let stop = BusStop(name: "Foo", id: "Baz", lat: 0, lon: 1)
        stops.append(stop)
        
        view = MockView()
        networkService = MockNetworkService(stops: [stop])
        presenter = MainPresenter(view: view, networkService: networkService, router: router)
        
        var catchStops: [BusStop]?
        
        networkService.getStops { result in
            switch result {
            case .success(let stops):
                catchStops = stops
            case .failure(let error):
                print(error)
            }
        }
        
        XCTAssertNotEqual(catchStops?.count, 0)
        XCTAssertEqual(catchStops?.count, stops.count)
    }


}
