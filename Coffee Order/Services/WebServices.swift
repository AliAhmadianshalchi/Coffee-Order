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

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

struct Resource<T: Codable> {
    let url: URL
    var httpMethod: HttpMethod = .get
    var body: Data? = nil
    
    init(url: URL) {
        self.url = url
    }
    
}

class WebService {
    
    func load<T>(resource: Resource<T>, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
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
