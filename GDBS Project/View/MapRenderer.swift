//
//  MapRenderer.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 21/01/25.
//

import Foundation
import SwiftUI
import MapKit

struct GeometryRenderer: UIViewRepresentable {
    var overlays: [MKOverlay]

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.addOverlays(overlays)
        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        uiView.addOverlays(overlays)
    }

    func makeCoordinator() -> MapDelegate {
        MapDelegate()
    }
}

