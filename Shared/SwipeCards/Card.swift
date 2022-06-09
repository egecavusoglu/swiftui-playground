//
//  Card.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/7/22.
//

import SwiftUI

struct Card: View {
    @State private var offset = CGSize.zero
    var person: Person
    var removeSelf: (Int) -> Void
    var bgColor: Color = .random
    var dislikeOpacity: CGFloat {
        if (offset.width < 0){
            return -offset.width / 100
        }
        return 0
    }
    
    var likeOpacity: CGFloat {
        if (offset.width > 0){
            return offset.width / 100
        }
        return 0
    }
    
    var body: some View {
        
        
        VStack{
            Spacer()
            HStack{
                DecisionLabel(decision: .like)
                    .opacity(likeOpacity)
                Spacer()
                DecisionLabel(decision: .dislike)
                    .opacity(dislikeOpacity)
            }
            .padding()
            HStack(alignment: .bottom){
                Text(person.name)
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .bold()
                Text("\(person.age)")
                    .foregroundColor(.white)
                    .baselineOffset(5)
                    .font(.headline)
                Spacer()
            }
        }
        
        .padding()
        .frame(width: UIScreen.main.bounds.width - 40, height: 600, alignment: .center)
        .background(LinearGradient(colors: [.clear, Color(red: 0.1, green: 0.1, blue: 0.1, opacity: 1)], startPoint: .top, endPoint: .bottom))
        .background(bgColor)
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
                    if abs(offset.width) > 150 {
                        // remove the card
                        withAnimation {
                            removeSelf(person.id)
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

struct DecisionLabel:  View {
    var decision: Decision
    var color: Color {
        return decision == .like ? Color.green : Color.red
    }
    var text : String {
        return decision == .like ? "LIKED" : "NOT LIKED"
    }
    
    var body: some View {
        Text(text)
            .font(.title)
            .bold()
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .foregroundColor(color)
            .border(color, width: 3)
            .cornerRadius(5, antialiased: true)
    }
}

enum Decision {
    case like
    case dislike
}

