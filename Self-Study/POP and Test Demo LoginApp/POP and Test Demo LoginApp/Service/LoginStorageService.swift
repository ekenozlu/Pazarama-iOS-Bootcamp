//
//  LoginStorageProtocol.swift
//  POP and Test Demo LoginApp
//
//  Created by Eken Özlü on 30.10.2023.
//

import Foundation

protocol LoginStorageService {
    var userAccessTokenKey : String { get }
    func setUserAccessToken(token: String)
    func getUserAccessToken() -> String?
}
