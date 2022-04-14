//
//  BusStop.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation

struct BusStop: Decodable {
    let name: String
    let id: String
    let lat: Float
    let lon: Float
}
