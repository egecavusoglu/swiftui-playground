//
//  DetailsPage.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/14/22.
//

import SwiftUI

struct DetailsPage: View {
    let screen_width = UIScreen.main.bounds.width
    let screen_height = UIScreen.main.bounds.height
    @State private var scrollOffset = CGFloat.zero
    
    var image_height: CGFloat {
        let initialHeight = screen_height / 2.5
        return initialHeight
    }
    
    let title = "Joshua Tree Park"
    
    
    var imageScale: CGFloat {
        if (scrollOffset < 0) {
            return (-scrollOffset / 300) + 1
        }
        return 1
    }
    
    var scrollview_y_position: CGFloat {
        if (scrollOffset <= 0) {
            return 0
        }
        return -scrollOffset
    }
    
    var body: some View {
        VStack {
            VStack {
                Image("nature")
                    .resizable()
                    .scaleEffect(imageScale)
            }
            .frame(width: screen_width, height: image_height, alignment: .top)
            .background(.indigo)
            .clipped()
            .border(.cyan, width: 3)
            ScrollView {
                
                HStack {
                    Text(title)
                        .font(.largeTitle)
                        .bold()
                    Spacer()
                }
                .padding()
                Spacer()
                    .background(GeometryReader {
                        Color.clear.preference(key: ViewOffsetKey.self,
                                               value: -$0.frame(in: .named("scroll")).origin.y)
                    })
                    .onPreferenceChange(ViewOffsetKey.self) { offset in
                        scrollOffset = offset + 73
                        print(scrollOffset)
                    }
            }
            .coordinateSpace(name: "scroll")
            .border(.red, width: 2)
        }
        .ignoresSafeArea()
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}
