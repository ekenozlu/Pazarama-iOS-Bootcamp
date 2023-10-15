//
//  Simpson.swift
//  ProgrammaticUI CollectionView
//
//  Created by Eken Özlü on 15.10.2023.
//

import Foundation

class Simpson {
    var name : String
    var job : String
    var age : Int
    var imageName : String
    
    init(name: String, job: String, age: Int, imageName: String) {
        self.name = name
        self.job = job
        self.age = age
        self.imageName = imageName
    }
}

let simpson1 = Simpson(name: "Bart Simpson", job: "Student", age: 15, imageName: "bart")
let simpson2 = Simpson(name: "Homer Simpson", job: "Chief", age: 50, imageName: "homer")
let simpson3 = Simpson(name: "Marge Simpson", job: "Unemployed", age: 45, imageName: "marge")
let simpson4 = Simpson(name: "Lisa Simpson", job: "Student", age: 14, imageName: "lisa")

let simpsonArray : [Simpson] = [simpson1,simpson2,simpson3,simpson4]
