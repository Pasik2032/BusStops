//
//  Routes.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 15.04.2022.
//

import Foundation

// Structure for getting the RoutePath array.
struct Routes: Decodable {
    public let routePath: [RoutePath]
}
