//
//  APIManager.swift
//  POP and Tests Demo
//
//  Created by Eken Özlü on 30.10.2023.
//

import Foundation


protocol UserAPIService {
    func fetchUser(completion: @escaping (Result<UserModel,Error>) -> Void)
}

class APIManager : UserAPIService {
    
    func fetchUser(completion: @escaping (Result<UserModel,Error>) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else { return }
            if let user = try? JSONDecoder().decode([UserModel].self, from: data).first {
                completion(.success(user))
            } else {
                completion(.failure(error!))
            }
        }.resume()
    }
    
    
}
