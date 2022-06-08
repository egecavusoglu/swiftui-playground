//
//  Card.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/7/22.
//

import SwiftUI

struct Card: View {
    @State private var offset = CGSize.zero
    var text: String
    var removeSelf: (String) -> Void
    
    var body: some View {
                    
            
            VStack{
                Text(text)
                    .foregroundColor(.white)
                    .font(.largeTitle)
            }
            .frame(width: UIScreen.main.bounds.width - 40, height: 600, alignment: .center)
            .background(.cyan)
            .cornerRadius(15, antialiased: true)
            .shadow(color: Color(red: 0.3, green: 0.3, blue:0.3, opacity: 0.4), radius: 20, x: 0, y: 0)
            .offset(x: offset.width * 2, y: 0)
            .opacity(2 - Double(abs(offset.width / 100)))
            .rotationEffect(.degrees(Double(offset.width / 20)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        if abs(offset.width) > 100 {
                            // remove the card
                            withAnimation {
                                removeSelf(text)
                            }
                            
                        } else {
                            withAnimation(.spring()) {
                                offset = .zero
                            }
                            
                        }
                    }
            )
    }
}

