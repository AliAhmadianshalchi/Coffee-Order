//
//  AddCoffeeOrderViewModel.swift
//  Coffee Order
//
//  Created by Ali Ahmadian shalchi on 13/07/2021.
//

import Foundation

struct AddCoffeeOrderViewModel {
    
    var name: String?
    var total: Double?
    
    var coffeeName: [String] {
        return CoffeeName.allCases.map { $0.rawValue.capitalized }
    }
    
    var coffeeSize: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
    
}
