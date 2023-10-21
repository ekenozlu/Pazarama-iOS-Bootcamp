//
//  WebService.swift
//  MVVM Arch Demo
//
//  Created by Eken Özlü on 21.10.2023.
//

import Foundation

enum CryptoError : Error {
    case serverError
    case decodingError
    case urlError
}


class WebService {
    
    func downloadCurrencies(url : URL, completion : @escaping (Result<[CryptoModel],CryptoError>) -> ()){
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, error == nil {
                do {
                    let cryptoList = try JSONDecoder().decode([CryptoModel].self, from: data)
                    completion(.success(cryptoList))
                } catch {
                    completion(.failure(.decodingError))
                }
            } else {
                completion(.failure(.serverError))
            }
        }.resume()
    }
    
    
}
