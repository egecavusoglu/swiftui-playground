//
//  NationalPark.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/20/22.
//

import Foundation

struct NationalPark {
    var title: String
    var description: String
    var location: USLocation
}

struct USLocation {
    let state: String
}

let JOSHUA_TREE_PARK = NationalPark(title: "Joshua Tree Park", description: "Joshua Tree National Park is a vast protected area in southern California. It's characterized by rugged rock formations and stark desert landscapes. Named for the region’s twisted, bristled Joshua trees, the park straddles the cactus-dotted Colorado Desert and the Mojave Desert, which is higher and cooler.", location: USLocation(state: "California"))
