//
//  main.swift
//  Struct Project
//
//  Created by Eken Özlü on 21.10.2023.
//

import Foundation


let musicianClass = MusicianClass(name: "Eken", age: 22, instrument: "Guitar")
var musicianStruct = MusicianStruct(name: "Eken", age: 22, instrument: "Guitar")

print(musicianClass.name)
print(musicianStruct.name)

//Immutability
musicianClass.age += 1
print(musicianClass.age)

musicianStruct.age += 1
print(musicianStruct.age)

print("------------------------")

//Reference vs Value Type
let copyOfMusicianClass = musicianClass
print(copyOfMusicianClass.name)

var copyOfMusicianStruct = musicianStruct
print(musicianStruct.name)

copyOfMusicianClass.age += 1
copyOfMusicianStruct.age += 1

print(copyOfMusicianClass.age)
print(copyOfMusicianStruct.age)

print("------------------------")

print(musicianClass.age)
print(musicianStruct.age)

print("------------------------")

//Tuples
let myTuple = (1,3,5)
print(myTuple.0)

var varTuple = (2,4,6)
varTuple.0 = 100
print(varTuple.0)

let myTuple2 = (name: "Eken", age: 22)
print(myTuple2.age)

let myTuple3 : (String,String)
myTuple3.0 = "Eken"
myTuple3.1 = "Özlü"

print("------------------------")

let myNumber = "10"

func convertToIntIflet(stringInput : String) -> Int {
    if let myInt = Int(stringInput) {
        return myInt
    } else {
        return 0
    }
}

func convertToIntGuardLet(stringInput : String) -> Int {
    guard let myInt = Int(stringInput) else {
        return 0
    }
    return myInt
}

print(convertToIntIflet(stringInput: myNumber))
print(convertToIntGuardLet(stringInput: myNumber))

print("------------------------")

//Closure
func sum(x: Int, y: Int) -> Int {
    return x+y
}
print(sum(x: 5, y: 10))

func calculate(x: Int, y: Int, myFunc: (Int,Int) -> Int) -> Int{
    return myFunc(x,y)
}
print(calculate(x: 20, y: 10, myFunc: sum(x:y:)))

let a = calculate(x: 20, y: 30) { x, y in
    return x + y
}
print(a)

let myArray = [10,15,12,24,56,76,24,65]

func highOrderFunction(num : Int) -> Int {
    return num / 5
}

print(myArray.map(highOrderFunction))
print(myArray.map({$0 / 5}))

