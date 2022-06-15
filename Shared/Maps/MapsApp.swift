//
//  MapsApp.swift
//  Ege's Playground (iOS)
//
//  Created by Ege Çavuşoğlu on 6/10/22.
//

import SwiftUI
import MapKit

struct MapsApp: View {
    @State private var coordinates = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.4, longitude: -122.05), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    @State private var pois = INITIAL_POIS
    
    var body: some View {
        Map(coordinateRegion: $coordinates,showsUserLocation: true,  annotationItems: pois) { poi in
            MapAnnotation(coordinate: poi.coordinates) {
                Marker(color: poi.color)
            }
            
        }
        .navigationTitle("Maps")
        .ignoresSafeArea(.all, edges: .bottom)
    }
}

struct MapsApp_Previews: PreviewProvider {
    static var previews: some View {
        MapsApp()
    }
}
