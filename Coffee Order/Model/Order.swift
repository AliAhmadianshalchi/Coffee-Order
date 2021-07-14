//
//  Order.swift
//  Coffee Order
//
//  Created by Ali Ahmadian shalchi on 13/07/2021.
//

import Foundation

enum CoffeeName: String, Codable, CaseIterable {
    case cappuccino
    case latte
    case cortado
    case americano
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small
    case medium
    case large
}

struct Order: Codable {
    
    let name: String
    let coffeeName: CoffeeName
    let total: String
    let size: CoffeeSize
    
}
