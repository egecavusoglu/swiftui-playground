//
//  Marker.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/10/22.
//

import SwiftUI
import MapKit

struct Marker: View {
    var color: Color
    var body: some View {
        VStack(spacing: 0) {
              Image(systemName: "mappin.circle.fill")
                .font(.title)
                .foregroundColor(color)
              
              Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(color)
                .offset(x: 0, y: -5)
            }
    }
}
