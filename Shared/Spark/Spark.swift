//
//  Spark.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 5/22/23.
//

import SwiftUI

struct Spark: View {
    @State private var scale: CGFloat = 1.0
       @State private var opacity: Double = 1.0

       var body: some View {
           Rectangle()
               .fill(Color.yellow)
               .frame(width: 20, height: 20)
               .scaleEffect(scale)
               .opacity(opacity)
               .animation(Animation.easeInOut(duration: 0.8).repeatForever())
               .onAppear {
                   animateSparkle()
               }
       }

       func animateSparkle() {
           scale = 2.0
           opacity = 0.0

           DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
               scale = 1.0
               opacity = 1.0
           }
       }
}
