//
//  Color.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/8/22.
//

import SwiftUI
extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1),
                     green: .random(in: 0...1),
                     blue: .random(in: 0...1))
    }
}
