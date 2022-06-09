//
//  Person.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/8/22.
//

import Foundation

struct Person {
    var id: Int
    var name: String
    var age: Int
    var gender: Gender
}

enum Gender {
    case male
    case female
    case other
}

let INITIAL_PEOPLE: [Person] = [Person(id: 1, name: "John", age: 31, gender:   .male), Person(id: 2, name: "Jane", age: 28, gender: .female), Person(id: 3, name: "Jade", age: 26, gender: .female), Person(id: 4, name: "Joe", age: 22, gender: .male), Person(id: 5, name: "Jillian", age: 33, gender: .female)]

func generateRandomPerson() -> Person{
    let id = Int.random(in: 1...100000)
    let gender: Gender = Bool.random() == true ? .male : .female
    let age = Int.random(in: 19...65)
    let name = LIST_OF_NAMES[Int.random(in: 0...LIST_OF_NAMES.count - 1)]
    return Person(id: id, name: name, age: age, gender: gender)
}

let LIST_OF_NAMES = ["Alan", "Julia", "Jaclyn", "Kat", "Dan", "Mae"]
