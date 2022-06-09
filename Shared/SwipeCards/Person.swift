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
