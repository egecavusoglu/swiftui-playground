//
//  DetailsPage.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/14/22.
//

import SwiftUI

struct DetailsPage: View {
    var park: NationalPark = JOSHUA_TREE_PARK
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
                    VStack {
                        HStack {
                            Text(park.title)
                                .font(.largeTitle)
                                .bold()
                            Spacer()
                        }
                        Text(park.description)
                            
                        HStack {
                            Text("Trails")
                                .font(.title2)
                                .bold()
                            Spacer()
                        }
                        .padding(.top)
                        
                        
                        
                        ForEach (0...27, id: \.self) { index in
                            HStack{
                                Text("Trail \(index)")
                                Spacer()
                            }
                            .padding()
                            .frame(width: screen_width - 25, height: 50, alignment: .center)
                            .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(.gray, lineWidth: 1)
                                    )
                            
                            
                        }
                    }
                    .padding()
                }
                .readingScrollView(from: "scroll", into: $offset)
            }
        }
        .ignoresSafeArea()
        .navigationTitle(scrollOffset > image_height ? park.title : "")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailsPage_Previes: PreviewProvider {
    static var previews: some View {
        DetailsPage(park: JOSHUA_TREE_PARK)
    }
}
