//
//  AppContainerView.swift
//  todo-app
//
//  Created by Ege Çavuşoğlu on 6/7/22.
//

import SwiftUI

struct AppContainerView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("This is a playground where I get to test some SwitfUI concepts and acts as a cheat sheet.").padding()
                List {
                    ListItem(text: "Todo App", screen: AnyView(TodoContainerView()))
                    ListItem(text: "Swipe Cards", screen: AnyView(SwipeCardsContainer()))
                }
            }
            .navigationTitle(Text("Ege's Playground"))
        }
    }
}

struct AppContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AppContainerView()
    }
}
