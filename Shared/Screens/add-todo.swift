//
//  add-todo.swift
//  todo-app (iOS)
//
//  Created by Ege Çavuşoğlu on 1/5/22.
//

import SwiftUI

struct add_todo: View {
    @State var label = ""
    @State var description = ""
    
    var body: some View {
        VStack{
            HStack{
                Text("New Todo ").font(.title).fontWeight(.bold)
                    .padding()
                Spacer()
            }
            
            Form {
                
                TextField("Label", text: $label )
                TextField("Description", text: $description)
            }
        }
                .navigationTitle("New Todo")
    }
}

struct add_todo_Previews: PreviewProvider {
    static var previews: some View {
        add_todo()
    }
}
