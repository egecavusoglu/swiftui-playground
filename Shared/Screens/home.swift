//
//  ContentView.swift
//  Shared
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI

struct Home: View {
    @State var todos: [Todo] = INITIAL_TODOS;
    @State var counter = 0
    @State var inputText = ""
    @State var showAddSheet = false
    
    func addNewTodo(text: String, description: String) {
        if (text.count < 1){
            return
        }
        let newTodo = Todo(id: counter, text: text, description: description)
        todos.append(newTodo)
        counter = counter + 1
    }
    
    func toggleSheet(state: Bool){
        showAddSheet = state
    }
    
    var body: some View {
        NavigationView{
            Form {
                Button("Add +"){
                    toggleSheet(state: true)
                }
                .padding()
                TodoList(todos: $todos)
            }
            .navigationTitle("Todoozy")
            .sheet(isPresented: $showAddSheet){
                add_todo(setShowSheet: toggleSheet, submit: addNewTodo)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
