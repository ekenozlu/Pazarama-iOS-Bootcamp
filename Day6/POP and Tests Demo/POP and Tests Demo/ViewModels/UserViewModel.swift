//
//  UserViewModel.swift
//  POP and Tests Demo
//
//  Created by Eken Özlü on 30.10.2023.
//

import Foundation

class UserViewModel {
    
    private let userService : UserAPIService
    weak var delegate : UserViewModelProtocol?
    
    init(userService: UserAPIService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.fetchUser { [weak self] result in
            switch result {
            case .success(let model):
                self?.delegate?.updateView(name: model.name, username: model.username, email: model.email)
            case .failure:
                self?.delegate?.updateView(name: "No User", username: "", email: "")
            }
        }
    }
    
    
    
    
    
    
    
}
