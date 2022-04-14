//
//  data.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation

/* The class is necessary because of the specifics of the API.
 Since the API does not return an array, but an object in which
 there is a field with an array of stops. */
struct Data: Decodable {
    var data: [BusStop]
}
