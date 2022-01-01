//
//  TodoList.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI

struct TodoList:  View {
    @Binding var todos: [Todo]
    
    func removeFromList(id: Int) {
        todos = todos.filter{$0.id != id}
    }
    
    var body: some View {
        List {
            ForEach(todos , id: \.id){ item in
                TodoItem(todo: item, removeFromList: removeFromList)
            }
        }    }
}



