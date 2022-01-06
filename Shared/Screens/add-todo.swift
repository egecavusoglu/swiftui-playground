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
    var setShowSheet: (_ state: Bool) -> Void
    var submit: (_ text: String,_ description: String) -> Void
    
    func submitTodo() {
        submit(label, description)
        setShowSheet(false)
    }
    
    var body: some View {
        NavigationView{
            Form {
                TextField("Label", text: $label )
                    .padding()
                TextField("Description", text: $description)
                    .padding()
                Button {
                    submitTodo()
                } label: {
                    Text("Submit")
                        .padding()
                    
                }
                
            }
            .navigationTitle("New Todo")
            .navigationBarItems( trailing: Button("Cancel"){
                setShowSheet(false)
            })
            
        }
        
    }
}

func sampleFunc(state: Bool) {
    print("Closing modal")
}

func submit(text: String, description: String){
    print(text, description)
}

struct add_todo_Previews: PreviewProvider {
    static var previews: some View {
        add_todo(setShowSheet: sampleFunc, submit: submit)
    }
}
