//
//  GeoJSONLoader.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 24/01/25.
//


import MapKit


struct GeoJSONLoader {
    public func loadGeoJSON(into mapView: MKMapView, with regionData: [String: Region]) {
        guard let geoJSONURL = Bundle.main.url(forResource: "GoodCoordinates", withExtension: "geojson") else {
            print("GeoJSON não encontrado")
            return
        }

        do {
            let data = try Data(contentsOf: geoJSONURL)
            let decoder = MKGeoJSONDecoder()
            let geoJSONObjects = try decoder.decode(data)

            for object in geoJSONObjects {
                if let feature = object as? MKGeoJSONFeature,
                   let geometry = feature.geometry.first as? MKPolygon {
                    if let propertiesData = feature.properties,
                       let propertiesString = String(data: propertiesData, encoding: .utf8),
                       let jsonData = propertiesString.data(using: .utf8),
                       let properties = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
                       let regionName = properties["NOMCOMAR"] as? String {
                        geometry.title = regionName.lowercased() // Associa o nome da região
                        print(regionName)
                    }
                    mapView.addOverlay(geometry)
                }
            }
        } catch {
            print("Erro ao carregar GeoJSON: \(error)")
        }
    }



    static func getRegionColor(for feature: MKGeoJSONFeature, using data: [String: Region]) -> UIColor {
        guard let propertiesData = feature.properties,
              let properties = try? JSONSerialization.jsonObject(with: propertiesData) as? [String: Any],
              let regionName = properties["NOMCOMAR"] as? String else {
            print("Tudo cinza")
            return .gray
        }
        print("Polígono carregado para a região: \(regionName)")


        if let region = data[regionName] {
            return ColorUtils.calculateColor(for: region.score, minValue: 0.0, maxValue: 100.0)
        }

        return .gray
    }
}
