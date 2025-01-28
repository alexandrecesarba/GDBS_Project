//
//  DatabaseManager.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 27/01/25.
//


import PostgresClientKit

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private init() {}
    
    func fetchData() -> [(geom: String, codicomar: String, nomcomar: String, capcomar: String, areac5000: Double, DB_IDQA: Int, DB_NombreD: String, DB_Persone: Int, DB_RendaPe: Double)] {
        var data: [(geom: String, codicomar: String, nomcomar: String, capcomar: String, areac5000: Double, DB_IDQA: Int, DB_NombreD: String, DB_Persone: Int, DB_RendaPe: Double)] = []
        
        do {
            var configuration = PostgresClientKit.ConnectionConfiguration()
            configuration.host = "localhost"
            configuration.port = 5433
            configuration.database = "postgres"
            configuration.user = "paumarti"
            configuration.credential = .trust
            configuration.ssl = false
            
            let connection = try PostgresClientKit.Connection(configuration: configuration)
            defer { connection.close() }
            
            let query = "SELECT ST_AsGeoJSON(geom) AS geom_json,\"CODICOMAR\",\"NOMCOMAR\",\"CAPCOMAR\",\"AREAC5000\",\"DB_IDQA\",\"DB_NombreD\",\"DB_Persone\",\"DB_RendaPe\" FROM \"GoodCoordinates\";"
            let statement = try connection.prepareStatement(text: query)
            defer { statement.close() }
            
            let cursor = try statement.execute()
            defer { cursor.close() }
            
            for row in cursor {
                let columns = try row.get().columns
                                let geomJson = try columns[0].string()
                                let codicomar = try columns[1].string()
                                let nomcomar = try columns[2].string()
                                let capcomar = try columns[3].string()
                                let areac5000 = try columns[4].double()
                                let DB_IDQA = try columns[5].int()
                                let DB_NombreD = try columns[6].string()
                                let DB_Persone = try columns[7].int()
                                let DB_RendaPe = try columns[8].double()

                                data.append((geom: geomJson, codicomar: codicomar, nomcomar: nomcomar, capcomar: capcomar, areac5000: areac5000, DB_IDQA: DB_IDQA, DB_NombreD: DB_NombreD, DB_Persone: DB_Persone, DB_RendaPe: DB_RendaPe))
            }
            
            
        } catch {
            print("Error connecting to the database or executing the query: \(error)")
        }
        return data
    }
}
