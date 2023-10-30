//
//  RootViewModel.swift
//  POP and Test Demo LoginApp
//
//  Created by Eken Özlü on 30.10.2023.
//

import Foundation

class RootViewModel {
    
    private let loginStorageService : LoginStorageService
    
    weak var delegate : RootViewModelProtocol?
    
    init(loginStorageService: LoginStorageService) {
        self.loginStorageService = loginStorageService
    }
    
    func checkLogin() {
        if let accessToken = loginStorageService.getUserAccessToken(), !accessToken.isEmpty {
            delegate?.showMainVC()
        } else {
            delegate?.showLoginVC()
        }
    }
    
    
}
