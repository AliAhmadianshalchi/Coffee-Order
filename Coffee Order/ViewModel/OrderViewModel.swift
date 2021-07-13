//
//  OrderViewModel.swift
//  Coffee Order
//
//  Created by Ali Ahmadian shalchi on 13/07/2021.
//

import Foundation

class OrderListViewModel {
    
    var ordersViewModel: [OrderViewModel]
    
    init() {
        self.ordersViewModel = [OrderViewModel]()
    }
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.ordersViewModel[index]
    }
    
}

struct OrderViewModel {
    let order: Order
    
    var name: String {
        return self.order.name
    }
    
    var total: Double {
        return self.order.total
    }
    
    var coffeeName: String {
        return self.order.coffeeName.rawValue.capitalized
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
    
    
}


