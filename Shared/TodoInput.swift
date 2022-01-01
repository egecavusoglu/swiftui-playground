//
//  TodoInput.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI


struct TodoInput: View {
    var addNewTodo: (_ text: String) -> Void
    @Binding var inputText: String
    
    func addTodo() {
        addNewTodo(self.inputText)
        self.inputText = ""
    }
    
    var body: some View {
        HStack {
        TextField("New todo", text: $inputText)
            Button(action: addTodo){
                Image(systemName: "plus")
            }
        }.padding()
    }
}
