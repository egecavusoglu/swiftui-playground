//
//  TodoItem.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI

struct TodoItem: View {
    var todo: Todo
    var removeFromList: (_ id:Int) -> Void
    
    func removeSelf() {
        removeFromList(self.todo.id)
    }
    
    var body: some View {
        Text(todo.text)
            .swipeActions{
            Button("Delete") {
                removeSelf()
            }
            .tint(.red)
        }
        .padding()
        .background(Color(UIColor.secondarySystemGroupedBackground))
        
    }
}
