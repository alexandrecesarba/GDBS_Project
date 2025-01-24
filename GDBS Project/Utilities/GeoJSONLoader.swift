import MapKit

public class GeoJSONLoader {
    func loadGeoJSON(into mapView: MKMapView, with regionData: [String: Region]) {
        guard let geoJSONURL = Bundle.main.url(forResource: "GoodCoordinates", withExtension: "geojson") else {
            print("Arquivo GeoJSON não encontrado no bundle.")
            return
        }
        print("Caminho do GeoJSON: \(geoJSONURL)")

        do {
            let data = try Data(contentsOf: geoJSONURL)
            print("GeoJSON carregado com sucesso, tamanho: \(data.count) bytes")

            let decoder = MKGeoJSONDecoder()
            print("Decodificando GeoJSON...")
            let geoJSONObjects = try decoder.decode(data)
            print("GeoJSON decodificado com sucesso, total de objetos: \(geoJSONObjects.count)")

            for object in geoJSONObjects {
                print("Tipo do objeto decodificado: \(type(of: object))")

                if let feature = object as? MKGeoJSONFeature {
                    print("Feature válida encontrada com propriedades: \(String(describing: feature.properties))")

                    if let geometry = feature.geometry.first {
                        print("Geometria encontrada: \(type(of: geometry))")

                        if let polygon = geometry as? MKPolygon {
                            // Configura o título do polígono
                            configurePolygon(polygon, with: feature, on: mapView)
                        } else if let multiPolygon = geometry as? MKMultiPolygon {
                            print("MultiPolygon encontrado. Convertendo em polígonos.")
                            for polygon in multiPolygon.polygons {
                                configurePolygon(polygon, with: feature, on: mapView)
                            }
                        } else {
                            print("Geometria não é compatível: \(geometry)")
                        }
                    } else {
                        print("Nenhuma geometria encontrada para o feature.")
                    }
                } else {
                    print("Objeto GeoJSON inesperado: \(object)")
                }
            }
        } catch {
            print("Erro ao carregar ou decodificar o GeoJSON: \(error)")
        }
    }

    private func configurePolygon(_ polygon: MKPolygon, with feature: MKGeoJSONFeature, on mapView: MKMapView) {
        if let propertiesData = feature.properties,
           let propertiesString = String(data: propertiesData, encoding: .utf8),
           let jsonData = propertiesString.data(using: .utf8),
           let properties = try? JSONSerialization.jsonObject(with: jsonData) as? [String: Any],
           let regionName = properties["NOMCOMAR"] as? String {
            polygon.title = regionName.lowercased()
            print("Polígono carregado para a região: \(regionName.lowercased())")
            mapView.addOverlay(polygon)
        } else {
            print("Falha ao processar propriedades do GeoJSON.")
        }
    }
}
