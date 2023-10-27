//
//  User.swift
//  SwiftUI Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import Foundation

struct User : Identifiable, Hashable {
    let id   : String = UUID().uuidString
    let name : String
}

let user1 = User(name: "Eken")
let user2 = User(name: "Mehmet")
let user3 = User(name: "Atıl")
let user4 = User(name: "Yakup")

let userList = [user1,user2,user3,user4]
