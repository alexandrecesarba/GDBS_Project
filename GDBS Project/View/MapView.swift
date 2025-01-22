import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        loadGeoJSON(mapView: mapView)

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    private func loadGeoJSON(mapView: MKMapView) {
        guard let geoJSONURL = Bundle.main.url(forResource: "GoodCoordinates", withExtension: "geojson") else {
            print("Error: GSON not found in bundle")
            return
        }

        do {
            let data = try Data(contentsOf: geoJSONURL)
            let decoder = MKGeoJSONDecoder()
            let geoJSONObjects = try decoder.decode(data)

            for object in geoJSONObjects {
                if let feature = object as? MKGeoJSONFeature {
                    print("Feature Properties: \(String(describing: feature.properties))")
                    for geometry in feature.geometry {
                        if let polygon = geometry as? MKPolygon {
                            mapView.addOverlay(polygon)
                        }
                        if let multiPolygon = geometry as? MKMultiPolygon {
                            mapView.addOverlay(multiPolygon)
                        }
                    }
                }
            }
        } catch {
            print("Error trying to load JSON: \(error.localizedDescription)")
        }
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if let polygon = overlay as? MKPolygon {
            let renderer = MKPolygonRenderer(polygon: polygon)
            renderer.fillColor = UIColor.systemPurple.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.black
            renderer.lineWidth = 1
            return renderer
        } else if let multiPolygon = overlay as? MKMultiPolygon {
            let renderer = MKMultiPolygonRenderer(multiPolygon: multiPolygon)
            renderer.fillColor = UIColor.systemPurple.withAlphaComponent(0.5)
            renderer.strokeColor = UIColor.black
            renderer.lineWidth = 1
            return renderer
        }

        return MKOverlayRenderer()
    }
}
