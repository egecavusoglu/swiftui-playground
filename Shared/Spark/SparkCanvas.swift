//
//  SparkCanvas.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 5/22/23.
//

import SwiftUI

struct SparkCanvas: View {
    var body: some View {
        VStack {
            Canvas { context, size in
                let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
                Spark()
                    .position(x: rect.midX, y: rect.midY)
                    .drawingGroup()
                    .onAppear {
                        animateSparkle()
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black)
        }
    }

    func animateSparkle() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                animateSparkle()
            }
        }
}

struct SparkCanvas_Previews: PreviewProvider {
    static var previews: some View {
        SparkCanvas()
    }
}
