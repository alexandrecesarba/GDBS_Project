//
//  region.swift
//  GDBS Project
//
//  Created by Alexandre César Brandão de Andrade on 13/01/25.
//

import Foundation

struct Region {
    let name: String
    let idqa: Double
    let crimes: Double
    let population: Double
    let income: Double
    // Punctuation Formula
    var score: Double {
        (idqa * 0.4) + (income * 0.3) - (crimes * 0.3)
    }
}


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
