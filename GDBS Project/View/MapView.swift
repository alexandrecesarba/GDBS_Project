import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    @Binding var selectedIndicator: IndicatorType
    @State private var locations: [(geom: String, codicomar: String, nomcomar: String, capcomar: String, areac5000: Double, DB_IDQA: Int, DB_NombreD: String, DB_Persone: Int, DB_RendaPe: Double)] = []

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator

        DispatchQueue.global(qos: .userInitiated).async {
            let fetchedLocations = DatabaseManager.shared.fetchData()

            DispatchQueue.main.async {
                self.locations = fetchedLocations
                updateMap(mapView: mapView)
            }
        }

        return mapView
    }

    func updateUIView(_ uiView: MKMapView, context: Context) {
        updateMap(mapView: uiView)
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    private func updateMap(mapView: MKMapView) {
        mapView.removeOverlays(mapView.overlays)

        let values = locations.map { selectedIndicator.normalizedValue(for: $0) }
        let minValue = values.min() ?? 0
        let maxValue = values.max() ?? 1

        for location in self.locations {
            do {
                if let geoJSONData = location.geom.data(using: .utf8) {
                    let geoJSON = try JSONSerialization.jsonObject(with: geoJSONData, options: []) as? [String: Any]

                    if let featureType = geoJSON?["type"] as? String, featureType == "MultiPolygon",
                       let multiPolygonCoordinates = geoJSON?["coordinates"] as? [[[[Double]]]] {
                        for polygonCoordinates in multiPolygonCoordinates {
                            for ringCoordinates in polygonCoordinates {
                                var coordinatesArray: [CLLocationCoordinate2D] = []

                                for coordinate in ringCoordinates {
                                    if coordinate.count == 2 {
                                        let longitude = coordinate[0]
                                        let latitude = coordinate[1]
                                        coordinatesArray.append(CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
                                    }
                                }


                                let value = selectedIndicator.normalizedValue(for: location)
                                let normalizedValue = CGFloat(value - minValue) / CGFloat(maxValue - minValue)
                                let color = UIColor(
                                    red: normalizedValue,
                                    green: 0.0,
                                    blue: 1.0 - normalizedValue,
                                    alpha: 0.6
                                )

                                let polygon = ColoredPolygon(coordinates: coordinatesArray, count: coordinatesArray.count)
                                polygon.fillColor = color
                                mapView.addOverlay(polygon)
                            }
                        }
                    }
                }
            } catch {
                print("Failed to parse GeoJSON for location: \(location.codicomar). Error: \(error)")
            }
        }
    }

    class Coordinator: NSObject, MKMapViewDelegate {
        override init() {
            super.init()
        }

        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            if let polygon = overlay as? ColoredPolygon {
                let renderer = MKPolygonRenderer(polygon: polygon)
                renderer.fillColor = polygon.fillColor
                renderer.strokeColor = .black
                renderer.lineWidth = 1
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}

class ColoredPolygon: MKPolygon {
    var fillColor: UIColor?
}

enum IndicatorType: String, CaseIterable, Identifiable {
    case idqa = "IDQA"
    case crimes = "Crimes"
    case income = "Income per capita"

    var id: String { rawValue }

    func value(for location: (geom: String, codicomar: String, nomcomar: String, capcomar: String, areac5000: Double, DB_IDQA: Int, DB_NombreD: String, DB_Persone: Int, DB_RendaPe: Double)) -> Double {
        switch self {
        case .idqa:
            return Double(location.DB_IDQA)
        case .crimes:
            return Double(location.DB_NombreD) ?? 0.0
        case .income:
            return location.DB_RendaPe
        }
    }

    func normalizedValue(for location: (geom: String, codicomar: String, nomcomar: String, capcomar: String, areac5000: Double, DB_IDQA: Int, DB_NombreD: String, DB_Persone: Int, DB_RendaPe: Double)) -> Double {
        let value = value(for: location)

        if self == .crimes {
            return log(max(value, 1.0))
        }

        return value
    }
}

