//
//  Landmark.swift
//  SwiftUI LandmarkBool
//
//  Created by Eken Özlü on 27.10.2023.
//

import Foundation

struct Landmark: Identifiable {
    let id = UUID().uuidString
    let name : String
    let image : String
    let country : String
    let year : String
}

let landmark1 = Landmark(name: "Galata Tower", image: "galata", country: "Türkiye", year: "1500")
let landmark2 = Landmark(name: "Bosphorus Bridge", image: "bogazkoprusu", country: "Türkiye", year: "1500")
let landmark3 = Landmark(name: "Suleymaniye Mosque", image: "suleymaniye", country: "Türkiye", year: "1500")
let landmark4 = Landmark(name: "Maiden Tower", image: "kızkulesi", country: "Türkiye", year: "1500")

let landmarkList = [landmark1,landmark2,landmark3,landmark4]
