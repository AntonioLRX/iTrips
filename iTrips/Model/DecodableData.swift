//
//  DecodableData.swift
//  AluraViagens
//
//  Created by Ândriu Felipe Coelho on 28/01/21.
//

import Foundation

let sectionTrips: [TripViewModel]? = load("server-response.json")

func load(_ filename: String) -> [TripViewModel]? {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        
        guard let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
            fatalError("error to read json dictionary")
        }
        
        guard let tripList = json["viagens"] as? [String: Any] else {
            fatalError("error to read travel list")
        }
        
        guard let jsonData = TripsTypes.jsonToData(tripList) else { return nil }
        
        let tripsTypes = TripsTypes.decodeJson(jsonData)
        
        var tripListViewModel: [TripViewModel] = []
        
        for section in tripList.keys {
            switch TripViewModelType(rawValue: section)  {
            case .highlights:
                if let highlights = tripsTypes?.highlights {
                    let highlightViewModel = TripHighlightViewModel(highlights)
                    tripListViewModel.insert(highlightViewModel, at: 0)
                }
            default:
                break
            }
        }
        
        return tripListViewModel
    } catch {
        fatalError("Couldn't parse")
    }
}
