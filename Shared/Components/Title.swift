//
//  Title.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI

struct Title:  View {
    var text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(text).font(.title).fontWeight(.bold)
                Spacer()
            }.padding()
        }
    }
}

