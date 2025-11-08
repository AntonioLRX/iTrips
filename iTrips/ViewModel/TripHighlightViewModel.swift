//
//  TripHighlightViewModel.swift
//  iTrips
//
//  Created by Antonio Lucas Reginaldo Xavier on 08/11/25.
//

import Foundation

class TripHighlightViewModel: TripViewModel {
    var sectionTitle: String {
        return "Destaques"
    }
    
    var type: TripViewModelType {
        return .highlights
    }
    
    var trips: [Trip]
    
    var numberLines: Int {
        return trips.count
    }
    
    init(_ trips: [Trip]) {
        self.trips = trips
    }
    
}
