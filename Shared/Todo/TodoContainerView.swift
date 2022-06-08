//
//  ContentView.swift
//  Shared
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI

struct TodoContainerView: View {
    @State var todos: [Todo] = INITIAL_TODOS;
    @State var counter = 0
    @State var inputText = ""
    
    func addNewTodo(text: String) {
        if (text.count < 1){
            return
        }
        let newTodo = Todo(id: counter, text: text)
        todos.append(newTodo)
        counter = counter + 1
    }
    
    var body: some View {
        Form {
            TodoInput(addNewTodo: addNewTodo, inputText: $inputText)
            TodoList(todos: $todos)
        }
        .navigationTitle("Todo App")
        
    }
}

struct TodoContainerView_Previews: PreviewProvider {
    static var previews: some View {
        TodoContainerView()
    }
}
