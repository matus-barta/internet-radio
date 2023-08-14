//
//  APIManager.swift
//  internet radio
//
//  Created by Matúš Barta on 11/08/2023.
//

import Foundation

enum DataError: Error {
    case invalidData
    case invalidResponse
    case message(_ error: Error?)
}

class APIManager {
    static let shared = APIManager()
    private init() { }
    
    let url = URL(fileURLWithPath: "anyURL")
    
// @escaping is used here, because this is a background task.
// If you write a print statemnet after the dataTask completes, i.e. after resume(), then it will execute beforehand.
// This happens because it is time consuming task and can not be implemented on main thread.
//@escaping captures data in memeory.

    func fetchData(completion: @escaping (Result<[Radio], Error>) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(.invalidData))
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ... 299  ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            // JSONDecoder() converts data to model of type Array
            do {
                let products = try JSONDecoder().decode([Radio].self, from: data)
                completion(.success(products))
            }
            catch {
                completion(.failure(.message(error)))
            }
        }.resume()
    }
}
