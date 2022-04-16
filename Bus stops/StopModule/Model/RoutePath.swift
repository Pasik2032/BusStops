//
//  RoutePath.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 15.04.2022.
//

import Foundation

struct RoutePath: Decodable {
    let type: String
    let number: String
    let timeArrival: [String]
}
