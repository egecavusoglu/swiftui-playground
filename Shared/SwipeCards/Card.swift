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
        GeometryReader { geometry in
            let widthGap: CGFloat = 30
            let width: CGFloat = geometry.size.width - widthGap
            let heightGap: CGFloat = 60
            let height: CGFloat = geometry.size.height - heightGap
            
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
            .frame(width: width, height: height, alignment: .center)
            .background(LinearGradient(colors: [.clear, Color(red: 0.1, green: 0.1, blue: 0.1, opacity: 1)], startPoint: .top, endPoint: .bottom))
            .background(bgColor)
            .cornerRadius(15, antialiased: true)
            .shadow(color: Color(red: 0.1, green: 0.1, blue:0.1, opacity: 0.6), radius: 10, x: 0, y: 0)
            .offset(x: widthGap / 2, y: heightGap - 10)
            .offset(x: (offset.width * 1.4), y: 0)
            .opacity(2 - Double(abs(offset.width / 130)))
            .rotationEffect(.degrees(Double(offset.width / 20)))
            .gesture(
                DragGesture()
                    .onChanged { gesture in
                        offset = gesture.translation
                    }
                    .onEnded { _ in
                        if abs(offset.width) > 120 {
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
            .font(.title2)
            .bold()
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .foregroundColor(color)
            .border(color, width: 3)
            .cornerRadius(5, antialiased: true)
            .lineLimit(1)
            .minimumScaleFactor(0.1)
    }
}

enum Decision {
    case like
    case dislike
}

