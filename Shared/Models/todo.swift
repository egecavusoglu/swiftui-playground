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

let SAMPLE_TODO = Todo(id: 1, text: "This is a sample todo!", description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.")

let INITIAL_TODOS = [Todo(id: -1, text: "Your first todo!", description: ""), Todo(id: -2, text: "Swipe left to delete.", description: "")]
