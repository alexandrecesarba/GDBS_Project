//
//  Coordinator.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 24/01/25.
//

import Foundation
import MapKit

class Coordinator: NSObject, MKMapViewDelegate {
    let regionData: [String: Region]

    init(regionData: [String: Region]) {
        self.regionData = regionData
    }

    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        print("Chamado rendererFor overlay") // Adicione este log

        if let polygon = overlay as? MKPolygon {
            let renderer = MKPolygonRenderer(polygon: polygon)

            if let regionName = polygon.title?.lowercased(),
               let region = regionData[regionName] {
                print("Região encontrada: \(regionName), Score: \(region.score)")
                renderer.fillColor = ColorUtils.calculateColor(for: region.score, minValue: 0.0, maxValue: 100.0)
            } else {
                print("Região não encontrada: \(polygon.title ?? "Unknown")")
                renderer.fillColor = UIColor.gray
            }

            renderer.strokeColor = UIColor.black
            renderer.lineWidth = 1
            return renderer
        }

        return MKOverlayRenderer()
    }
}


