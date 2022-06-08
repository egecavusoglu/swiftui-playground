//
//  SwipeCardsContainer.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/7/22.
//

import SwiftUI

let CARDS = ["A", "B", "C", "D", "E", "F"]

struct SwipeCardsContainer: View {
    @State var cards: [String] = CARDS
    
    func removeItem(text: String) ->Void {
        cards = cards.filter{$0 != text}
    }
    
    
    var body: some View {
        ZStack{
            Button {
                cards = CARDS
            } label: {
                Text("Get More Cards")
            }
            
            ForEach(cards.reversed().indices, id: \.self) { index in
                let ind = cards.count -  (index + 1)
                let yOffset = ind > 3 ? 0 :CGFloat(ind * -10)
                Card(text: cards[ind], removeSelf: removeItem)
                    .offset(x: 0, y: yOffset)
            }
        }
        .navigationTitle(Text("Swipe Cards"))
    }
}

struct SwipeCardsContainer_Previews: PreviewProvider {
    static var previews: some View {
        SwipeCardsContainer()
    }
}
