//
//  WebService.swift
//  SwiftUI API Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import Foundation

enum CryptoError : Error {
    case badUrl
    case parsingURL
    case serverError
}

class WebService {
    
    
    public func downloadCurrencies(url: URL, completion: @escaping (Result<[CryptoModel],CryptoError>) -> () ) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let response = try JSONDecoder().decode([CryptoModel].self, from: data)
                    completion(.success(response))
                } catch {
                    completion(.failure(.badUrl))
                }
            } else {
                completion(.failure(.badUrl))
            }
        }.resume()
    }
}





