//
//  TipoDeViagens.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 07/02/21.
//

import Foundation

struct TripsTypes: Codable {
    
    var highlights: [Trip]?
    var offers: [Trip]?
    var internationals: [Trip]?
    
    static func jsonToData(_ json:[String: Any]) -> Data? {
        return try? JSONSerialization.data(withJSONObject: json, options: [])
    }

    static func decodeJson(_ jsonData: Data) -> TripsTypes? {
        do {
            return try JSONDecoder().decode(TripsTypes.self, from: jsonData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
