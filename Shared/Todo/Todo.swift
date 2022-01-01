//
//  Todo.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import Foundation

// This is the fundamental data model of the todo item
struct Todo {
    var id: Int
    var text: String
    var description: String?
}

let INITIAL_TODOS = [Todo(id: -1, text: "Your first todo!", description: ""), Todo(id: -2, text: "Swipe left to delete.", description: "")]
