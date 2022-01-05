//
//  todo-details.swift
//  todo-app (iOS)
//
//  Created by Ege Çavuşoğlu on 1/5/22.
//

import SwiftUI

struct todo_details: View {
    var item: Todo
    
    var body: some View {
        VStack{
            HStack {
                Text(item.text).font(.title2).fontWeight(.medium)
                Spacer()
            }.padding()
            Text(item.description ?? "").padding(.horizontal)
            Spacer()
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct todo_details_Previews: PreviewProvider {
    
    static var previews: some View {
//        Home()
        todo_details(item: SAMPLE_TODO)
    }
}
