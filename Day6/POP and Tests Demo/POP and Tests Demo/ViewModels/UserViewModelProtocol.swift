//
//  UserViewModelOutput.swift
//  POP and Tests Demo
//
//  Created by Eken Özlü on 30.10.2023.
//

import Foundation

protocol UserViewModelProtocol : AnyObject {
    func updateView(name: String, username: String, email: String)
}
