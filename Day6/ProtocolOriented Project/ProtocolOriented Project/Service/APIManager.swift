//
//  APIManager.swift
//  ProtocolOriented Project
//
//  Created by Eken Özlü on 28.10.2023.
//

import Foundation

protocol UserService {
    func downloadUser(completion: @escaping (Result<UserModel,Error>) -> ())
}

class APIManager : UserService {
    
    func downloadUser(completion: @escaping (Result<UserModel,Error>) -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode([UserModel].self, from: data).last {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
}
