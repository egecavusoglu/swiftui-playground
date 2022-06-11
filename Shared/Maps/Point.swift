//
//  Point.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/10/22.
//

import Foundation
import SwiftUI
import MapKit

struct PointOfInterest: Identifiable {
    let id = UUID()
    var name: String
    var description: String
    var color: Color
    var coordinates: CLLocationCoordinate2D
}


let INITIAL_POIS = [PointOfInterest(name: "Safehouse", description: "This is our lovely home in Mountain View", color: .random, coordinates: CLLocationCoordinate2D(latitude: 37.39, longitude: -122.09))]
