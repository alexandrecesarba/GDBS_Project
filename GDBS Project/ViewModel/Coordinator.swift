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
        if let polygon = overlay as? MKPolygon {
            let renderer = MKPolygonRenderer(polygon: polygon)

            // Verifica se o título do polígono é válido
            if let regionName = polygon.title?.lowercased(), // Normaliza para minúsculas
               let region = regionData[regionName] {
                renderer.fillColor = ColorUtils.calculateColor(for: region.score, minValue: 0.0, maxValue: 100.0)
            } else {
                renderer.fillColor = UIColor.gray // Cor padrão para regiões não encontradas
            }


            renderer.strokeColor = UIColor.black
            renderer.lineWidth = 1
            return renderer
        }
        return MKOverlayRenderer()
    }
}


