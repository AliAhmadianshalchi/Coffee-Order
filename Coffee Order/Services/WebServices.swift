//
//  WebServices.swift
//  Coffee Order
//
//  Created by Ali Ahmadian shalchi on 12/07/2021.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

struct Resource<T: Codable> {
    let url: URL
}

class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url) { data, response, error in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            
            let result = try? JSONDecoder().decode(T.self,from: data)
            if let result = result {
                DispatchQueue.main.async {
                    completion(.success(result))
                }
            } else {
                completion(.failure(.decodingError))
            }
            
        }.resume()
        
    }
}

//Coffee Ordering API
//I have updated the coffee ordering API. Please make sure to use the following links when trying to consume the API.
//
//
//
//Get All Coffee Orders
//
//https://island-bramble.glitch.me/orders
//
//Method: GET
//
//
//
//Post a New Coffee Order
//
//https://island-bramble.glitch.me/orders
//
//Method: POST
//Body:
//name: String
//coffeeName: String
//total: Double
//size: String
//
//
//Delete All Coffee Orders
//
//https://island-bramble.glitch.me/clear-orders
//
//Method: GET
