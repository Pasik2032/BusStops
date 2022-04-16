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
    let color: String
    let fontColor: String
    
    var isGreen: Bool {
        get {
            let str = timeArrival.first?.split(separator: " ")[0] ?? "10 0"
            
            if let b = Int(str) {
                if b < 5 {
                    return true
                }
            } else {
                if str.prefix(1) == "<" {
                    return true
                }
            }
            return false
        }
    }
}
