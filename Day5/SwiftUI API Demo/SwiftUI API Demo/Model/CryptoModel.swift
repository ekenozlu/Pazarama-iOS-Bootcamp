//
//  CrptoModel.swift
//  SwiftUI API Demo
//
//  Created by Eken Özlü on 27.10.2023.
//

import Foundation

struct CryptoModel: Decodable,Identifiable {
    let id = UUID().uuidString
    let currency : String
    let price : String
}

//https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json
