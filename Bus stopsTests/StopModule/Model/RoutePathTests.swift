//
//  RoutePathTests.swift
//  Bus stopsTests
//
//  Created by Даниил Пасилецкий on 17.04.2022.
//

import XCTest
@testable import Bus_stops

class RoutePathTests: XCTestCase {
    func testIsGreen() {
        let rout = RoutePath(type: "foo", number: "bar", timeArrival: ["3"], color: "color", fontColor: "colorfont")
        let rout2 = RoutePath(type: "foo", number: "bar", timeArrival: ["<1"], color: "color", fontColor: "colorfont")
        let rout3 = RoutePath(type: "foo", number: "bar", timeArrival: ["100"], color: "color", fontColor: "colorfont")
        let rout4 = RoutePath(type: "foo", number: "bar", timeArrival: ["1:12"], color: "color", fontColor: "colorfont")
        
        XCTAssertTrue(rout.isGreen)
        XCTAssertTrue(rout2.isGreen)
        XCTAssertFalse(rout3.isGreen)
        XCTAssertFalse(rout4.isGreen)
    }

}
