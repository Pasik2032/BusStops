//
//  NetworkService.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func getStops(completion: @escaping (Result<[BusStop]?, Error>) -> Void)
}
class NetworkService: NetworkServiceProtocol{
    func getStops(completion: @escaping (Result<[BusStop]?, Error>) -> Void) {
        let urlString = "https://api.mosgorpass.ru/v8.2/stop"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            do {
                let obj = try JSONDecoder().decode(Data.self, from: data!)
                completion(.success(obj.data))
            }catch{
                completion(.failure(error))
            }
        }.resume()
    }
    
    
}
