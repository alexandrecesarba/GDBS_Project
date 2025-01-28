//
//  region.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 13/01/25.
//

import Foundation

struct Region {
    let name: String
    let idqa: Double?
    let crimes: Double
    let population: Double
    let income: Double
    // Punctuation Formula
    var score: Double {
        let idqaValue = idqa ?? 0.0 // if nil== 0
        return (idqaValue * 0.4) + (income * 0.3) - (crimes * 0.3)
    }
}

// Dicionário para associar os dados ao nome das regiões
let regionData: [String: Region] = [
    "alt camp": Region(name: "alt camp", idqa: 19.0, crimes: 15378.0, population: 147983.0, income: 34636.0),
    "alt emporda": Region(name: "alt emporda", idqa: 72.0, crimes: 109281.0, population: 180546.0, income: 28003.0),
    "alt penedes": Region(name: "alt penedes", idqa: 22.0, crimes: 52140.0, population: 108016.0, income: 32300.0),
    "alt urgell": Region(name: "alt urgell", idqa: nil, crimes: 4744.0, population: 88989.0, income: 25352.0),
    "alta ribagorca": Region(name: "alta ribagorca", idqa: nil, crimes: 2055.0, population: 23352.0, income: 28375.0),
    "anoia": Region(name: "anoia", idqa: 20.0, crimes: 41359.0, population: 162741.0, income: 24834.0),
    "bages": Region(name: "bages", idqa: 20.0, crimes: 62803.0, population: 143940.0, income: 29804.0),
    "baix camp": Region(name: "baix camp", idqa: 12.0, crimes: 123380.0, population: 209111.0, income: 26906.0),
    "baix ebre": Region(name: "baix ebre", idqa: 5.0, crimes: 36111.0, population: 116979.0, income: 25375.0),
    "baix emporda": Region(name: "baix emporda", idqa: 47.0, crimes: 83707.0, population: 185624.0, income: 24544.0),
    "baix llobregat": Region(name: "baix llobregat", idqa: 24.0, crimes: 422732.0, population: 189323.0, income: 36667.0),
    "baix penedes": Region(name: "baix penedes", idqa: nil, crimes: 70535.0, population: 223674.0, income: 18515.0),
    "barcelones": Region(name: "barcelones", idqa: 29.0, crimes: 2251761.0, population: 266597.0, income: 42134.0),
    "bergueda": Region(name: "bergueda", idqa: 16.0, crimes: 8823.0, population: 207424.0, income: 28254.0),
    "cerdanya": Region(name: "cerdanya", idqa: 24.0, crimes: 5779.0, population: 106956.0, income: 24906.0),
    "conca de barbera": Region(name: "conca de barbera", idqa: 22.0, crimes: 15378.0, population: 126523.0, income: 33713.0),
    "garraf": Region(name: "garraf", idqa: 15.0, crimes: 104678.0, population: 171945.0, income: 21090.0),
    "garrigues": Region(name: "garrigues", idqa: 30.0, crimes: 66650.0, population: 121194.0, income: 24577.0),
    "garrotxa": Region(name: "garrotxa", idqa: 31.0, crimes: 20087.0, population: 148090.0, income: 32710.0),
    "girones": Region(name: "girones", idqa: 20.0, crimes: 65051.0, population: 241783.0, income: 35777.0),
    "maresme": Region(name: "maresme", idqa: 23.0, crimes: 258771.0, population: 179740.0, income: 23012.0),
    "montsia": Region(name: "montsia", idqa: 33.0, crimes: 29170.0, population: 216746.0, income: 21618.0),
    "noguera": Region(name: "noguera", idqa: 52.0, crimes: 10816.0, population: 156337.0, income: 26901.0),
    "osona": Region(name: "osona", idqa: 26.0, crimes: 52044.0, population: 148542.0, income: 32350.0),
    "pallars jussa": Region(name: "pallars jussa", idqa: 16.0, crimes: 4594.0, population: 81636.0, income: 24671.0),
    "pallars sobira": Region(name: "pallars sobira", idqa: 43.0, crimes: 2297.0, population: 39285.0, income: 27360.0),
    "pla d'urgell": Region(name: "pla d'urgell", idqa: 30.0, crimes: 66650.0, population: 492153.0, income: 34198.0),
    "pla de l'estany": Region(name: "pla de l'estany", idqa: 18.0, crimes: 65051.0, population: 418884.0, income: 31355.0),
    "priorat": Region(name: "priorat", idqa: 70.0, crimes: 61690.0, population: 58632.0, income: 20457.0),
    "ribera d'ebre": Region(name: "ribera d'ebre", idqa: 14.0, crimes: 4312.0, population: 94997.0, income: 61419.0),
    "ripolles": Region(name: "ripolles", idqa: 77.0, crimes: 5569.0, population: 62476.0, income: 25680.0),
    "segarra": Region(name: "segarra", idqa: 18.0, crimes: 16512.0, population: 126949.0, income: 39620.0),
    "selva": Region(name: "selva", idqa: 20.0, crimes: 116396.0, population: 204178.0, income: 29046.0),
    "solsones": Region(name: "solsones", idqa: 19.0, crimes: 3447.0, population: 84062.0, income: 27497.0),
    "tarragones": Region(name: "tarragones", idqa: 13.0, crimes: 200854.0, population: 208813.0, income: 36839.0),
    "terra alta": Region(name: "terra alta", idqa: 60.0, crimes: 4312.0, population: 147184.0, income: 30131.0),
    "urgell": Region(name: "urgell", idqa: 33.0, crimes: 8502.0, population: 125040.0, income: 30819.0),
    "vall d'aran": Region(name: "vall d'aran", idqa: 19.0, crimes: 2055.0, population: 121090.0, income: 38042.0),
    "valles occidental": Region(name: "valles occidental", idqa: 31.0, crimes: 433887.0, population: 197384.0, income: 34019.0),
    "valles oriental": Region(name: "valles oriental", idqa: 29.0, crimes: 194840.0, population: 195986.0, income: 34544.0)
]

let regions = [
    ["NomComarca": "alt camp", "IDQA": 19.0, "NombreDeCrims": 15378.0, "PersonesPerCentre": 147983.0, "RendaPerCapita": 34636.0],
    ["NomComarca": "alt emporda", "IDQA": 72.0, "NombreDeCrims": 109281.0, "PersonesPerCentre": 180546.0, "RendaPerCapita": 28003.0],
    ["NomComarca": "alt penedes", "IDQA": 22.0, "NombreDeCrims": 52140.0, "PersonesPerCentre": 108016.0, "RendaPerCapita": 32300.0],
    ["NomComarca": "alt urgell", "IDQA": nil, "NombreDeCrims": 4744.0, "PersonesPerCentre": 88989.0, "RendaPerCapita": 25352.0],
    ["NomComarca": "alta ribagorca", "IDQA": nil, "NombreDeCrims": 2055.0, "PersonesPerCentre": 23352.0, "RendaPerCapita": 28375.0],
    ["NomComarca": "anoia", "IDQA": 20.0, "NombreDeCrims": 41359.0, "PersonesPerCentre": 162741.0, "RendaPerCapita": 24834.0],
    ["NomComarca": "bages", "IDQA": 20.0, "NombreDeCrims": 62803.0, "PersonesPerCentre": 143940.0, "RendaPerCapita": 29804.0],
    ["NomComarca": "baix camp", "IDQA": 12.0, "NombreDeCrims": 123380.0, "PersonesPerCentre": 209111.0, "RendaPerCapita": 26906.0],
    ["NomComarca": "baix ebre", "IDQA": 5.0, "NombreDeCrims": 36111.0, "PersonesPerCentre": 116979.0, "RendaPerCapita": 25375.0],
    ["NomComarca": "baix emporda", "IDQA": 47.0, "NombreDeCrims": 83707.0, "PersonesPerCentre": 185624.0, "RendaPerCapita": 24544.0],
    ["NomComarca": "baix llobregat", "IDQA": 24.0, "NombreDeCrims": 422732.0, "PersonesPerCentre": 189323.0, "RendaPerCapita": 36667.0],
    ["NomComarca": "baix penedes", "IDQA": nil, "NombreDeCrims": 70535.0, "PersonesPerCentre": 223674.0, "RendaPerCapita": 18515.0],
    ["NomComarca": "barcelones", "IDQA": 29.0, "NombreDeCrims": 2251761.0, "PersonesPerCentre": 266597.0, "RendaPerCapita": 42134.0],
    ["NomComarca": "bergueda", "IDQA": 16.0, "NombreDeCrims": 8823.0, "PersonesPerCentre": 207424.0, "RendaPerCapita": 28254.0],
    ["NomComarca": "cerdanya", "IDQA": 24.0, "NombreDeCrims": 5779.0, "PersonesPerCentre": 106956.0, "RendaPerCapita": 24906.0],
    ["NomComarca": "conca de barbera", "IDQA": 22.0, "NombreDeCrims": 15378.0, "PersonesPerCentre": 126523.0, "RendaPerCapita": 33713.0],
    ["NomComarca": "garraf", "IDQA": 15.0, "NombreDeCrims": 104678.0, "PersonesPerCentre": 171945.0, "RendaPerCapita": 21090.0],
    ["NomComarca": "garrigues", "IDQA": 30.0, "NombreDeCrims": 66650.0, "PersonesPerCentre": 121194.0, "RendaPerCapita": 24577.0],
    ["NomComarca": "garrigues", "IDQA": 30.0, "NombreDeCrims": 687.0, "PersonesPerCentre": 121194.0, "RendaPerCapita": 24577.0],
    ["NomComarca": "garrotxa", "IDQA": 31.0, "NombreDeCrims": 20087.0, "PersonesPerCentre": 148090.0, "RendaPerCapita": 32710.0],
    ["NomComarca": "girones", "IDQA": 20.0, "NombreDeCrims": 65051.0, "PersonesPerCentre": 241783.0, "RendaPerCapita": 35777.0],
    ["NomComarca": "maresme", "IDQA": 23.0, "NombreDeCrims": 258771.0, "PersonesPerCentre": 179740.0, "RendaPerCapita": 23012.0],
    ["NomComarca": "montsia", "IDQA": 33.0, "NombreDeCrims": 29170.0, "PersonesPerCentre": 216746.0, "RendaPerCapita": 21618.0],
    ["NomComarca": "noguera", "IDQA": 52.0, "NombreDeCrims": 10816.0, "PersonesPerCentre": 156337.0, "RendaPerCapita": 26901.0],
    ["NomComarca": "osona", "IDQA": 26.0, "NombreDeCrims": 52044.0, "PersonesPerCentre": 148542.0, "RendaPerCapita": 32350.0],
    ["NomComarca": "pallars jussa", "IDQA": 16.0, "NombreDeCrims": 4594.0, "PersonesPerCentre": 81636.0, "RendaPerCapita": 24671.0],
    ["NomComarca": "pallars sobira", "IDQA": 43.0, "NombreDeCrims": 2297.0, "PersonesPerCentre": 39285.0, "RendaPerCapita": 27360.0],
    ["NomComarca": "pla d'urgell", "IDQA": 30.0, "NombreDeCrims": 66650.0, "PersonesPerCentre": 492153.0, "RendaPerCapita": 34198.0],
    ["NomComarca": "pla de l'estany", "IDQA": 18.0, "NombreDeCrims": 65051.0, "PersonesPerCentre": 418884.0, "RendaPerCapita": 31355.0],
    ["NomComarca": "priorat", "IDQA": 70.0, "NombreDeCrims": 61690.0, "PersonesPerCentre": 58632.0, "RendaPerCapita": 20457.0],
    ["NomComarca": "ribera d'ebre", "IDQA": 14.0, "NombreDeCrims": 4312.0, "PersonesPerCentre": 94997.0, "RendaPerCapita": 61419.0],
    ["NomComarca": "ripolles", "IDQA": 77.0, "NombreDeCrims": 5569.0, "PersonesPerCentre": 62476.0, "RendaPerCapita": 25680.0],
    ["NomComarca": "segarra", "IDQA": 18.0, "NombreDeCrims": 16512.0, "PersonesPerCentre": 126949.0, "RendaPerCapita": 39620.0],
    ["NomComarca": "selva", "IDQA": 20.0, "NombreDeCrims": 116396.0, "PersonesPerCentre": 204178.0, "RendaPerCapita": 29046.0],
    ["NomComarca": "solsones", "IDQA": 19.0, "NombreDeCrims": 3447.0, "PersonesPerCentre": 84062.0, "RendaPerCapita": 27497.0],
    ["NomComarca": "tarragones", "IDQA": 13.0, "NombreDeCrims": 200854.0, "PersonesPerCentre": 208813.0, "RendaPerCapita": 36839.0],
    ["NomComarca": "terra alta", "IDQA": 60.0, "NombreDeCrims": 4312.0, "PersonesPerCentre": 147184.0, "RendaPerCapita": 30131.0],
    ["NomComarca": "urgell", "IDQA": 33.0, "NombreDeCrims": 8502.0, "PersonesPerCentre": 125040.0, "RendaPerCapita": 30819.0],
    ["NomComarca": "vall d'aran", "IDQA": 19.0, "NombreDeCrims": 2055.0, "PersonesPerCentre": 121090.0, "RendaPerCapita": 38042.0],
    ["NomComarca": "valles occidental", "IDQA": 31.0, "NombreDeCrims": 433887.0, "PersonesPerCentre": 197384.0, "RendaPerCapita": 34019.0],
    ["NomComarca": "valles oriental", "IDQA": 29.0, "NombreDeCrims": 194840.0, "PersonesPerCentre": 195986.0, "RendaPerCapita": 34544.0]
]
