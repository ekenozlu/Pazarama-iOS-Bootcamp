//
//  StructFile.swift
//  Struct Project
//
//  Created by Eken Özlü on 21.10.2023.
//

import Foundation

struct MusicianStruct {
    var name : String
    var age : Int
    var instrument : String
    
    mutating func dogumGunu(){
        self.age += 1
    }
}
