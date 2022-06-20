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
    @State var offset: CGPoint = .zero
    
    var scrollOffset: CGFloat {
        return offset.y
    }
    
    var image_height: CGFloat {
        let initialHeight = screen_height / 2.5
        return initialHeight
    }
    
    let title = "Joshua Tree Park"
    
    
    var imageScale: CGFloat {
        if (scrollOffset < 0) {
            return (-scrollOffset / 200) + 1
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
            ScrollView {
                
                VStack {
                    VStack {
                        Image("nature")
                            .resizable()
                            .scaleEffect(imageScale, anchor: .bottom)
                    }
                    .frame(width: screen_width, height: image_height, alignment: .top)
                    .background(.indigo)
                    
                    HStack {
                        Text(title)
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                    }
                    .padding()
                    
                    Spacer()
                    
                    ForEach (0...27, id: \.self) { index in
                        VStack {
                            Text("Box \(index)")
                        }
                        .frame(width: screen_width - 10, height: 50, alignment: .center)
                        .background(.cyan)       
                    }
                }
                .readingScrollView(from: "scroll", into: $offset)
            }
        }
        .ignoresSafeArea()
    }
}
