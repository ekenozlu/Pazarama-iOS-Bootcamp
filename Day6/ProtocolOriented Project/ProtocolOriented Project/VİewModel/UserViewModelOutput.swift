//
//  UserViewModelOutput.swift
//  ProtocolOriented Project
//
//  Created by Eken Özlü on 28.10.2023.
//

import Foundation

protocol UserViewModelOutput : AnyObject {
    func updateView(name: String, username: String, email: String)
}
