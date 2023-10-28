//
//  UserViewModel.swift
//  ProtocolOriented Project
//
//  Created by Eken Özlü on 28.10.2023.
//

import Foundation

class UserViewModel {
    
    private let userService : UserService
    
    weak var output : UserViewModelOutput?
    
    init(userService: UserService) {
        self.userService = userService
    }
    
    func fetchUsers() {
        userService.downloadUser { result in
            switch result {
            case .success(let user):
                self.output?.updateView(name: user.name, username: user.username, email: user.email)
            case .failure(_):
                self.output?.updateView(name: "No User", username: "", email: "")
            }
        }
    }
    
}
