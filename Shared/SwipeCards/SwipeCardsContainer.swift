//
//  SwipeCardsContainer.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/7/22.
//

import SwiftUI

struct SwipeCardsContainer: View {
    @State var cards: [Person] = INITIAL_PEOPLE
    
    func removeItem(id: Int) ->Void {
        cards = cards.filter{$0.id != id}
        cards.append(generateRandomPerson())
        
        
    }
    
    
    var body: some View {
        ZStack(alignment: .center){
            ForEach(cards.reversed(), id: \.id) { person in
                let index = cards.firstIndex(where: { p in
                    p.id == person.id
                })!
                let yOffset = index > 3 ? 0 :CGFloat(index * -10)
                
                Card(person: person, removeSelf: removeItem)
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
