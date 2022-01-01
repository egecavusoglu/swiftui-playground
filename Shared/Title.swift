//
//  Title.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 1/1/22.
//

import SwiftUI

struct Title:  View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Todo List").font(.title).fontWeight(.bold)
                Spacer()
            }.padding()
        }
    }
}

