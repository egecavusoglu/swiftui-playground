//
//  Color.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/8/22.
//

import SwiftUI
extension Color {
    static var random: Color {
        return Color(red: .random(in: 0.2...0.8),
                     green: 0.4,
                     blue: 0.7)
    }
}
