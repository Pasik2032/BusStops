//
//  RouterTests.swift
//  Bus stopsTests
//
//  Created by Даниил Пасилецкий on 17.04.2022.
//

import XCTest
@testable import Bus_stops

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }

}

class RouterTests: XCTestCase {
    
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    let builder = ModuleBuider()

    override func setUp() {
        router = Router(navigationController: navigationController, assemblyBuilder: builder)
    }

    override func tearDown() {
        router = nil
    }

    func testRouter() {
        router.showStop(stop: nil)
        let stopVC = navigationController.presentedVC
        XCTAssertTrue(stopVC is StopView)
    }

}
