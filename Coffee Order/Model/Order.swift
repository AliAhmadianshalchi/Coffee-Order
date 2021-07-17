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

extension Order {
    
    static var all: Resource<[Order]> = {
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL is incorrect!")
        }
        
        return Resource<[Order]>(url: url)
    }()
    
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://island-bramble.glitch.me/orders") else {
            fatalError("URL Is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
}

extension Order {
    
    init?(_ vm: AddCoffeeOrderViewModel) {
        
        guard let name = vm.name,
              let total = vm.total,
              let coffeeName = CoffeeName(rawValue: vm.selectedType!.lowercased()),
              let size = CoffeeSize(rawValue: vm.selectedSize!.lowercased()) else {
            return nil
        }
        
        self.name = name
        self.total = total
        self.coffeeName = coffeeName
        self.size = size
    }
}
