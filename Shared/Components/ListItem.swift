//
//  ListItem.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/7/22.
//

import SwiftUI

struct ListItem: View {
    var text: String
    var screen: AnyView
    
    
    var body: some View {
        NavigationLink {
            screen
        } label: {
            Text(text).foregroundColor(.blue)
        }

    }
}
