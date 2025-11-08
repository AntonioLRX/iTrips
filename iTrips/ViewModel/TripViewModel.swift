//
//  TripViewModel.swift
//  iTrips
//
//  Created by Antonio Lucas Reginaldo Xavier on 08/11/25.
//

import Foundation

enum TripViewModelType: String {
    case highlights
    case offers
    case internationals
}

protocol TripViewModel {
    var sectionTitle: String { get }
    var type: TripViewModelType { get }
    var trips: [Trip] { get set }
    var numberLines: Int { get }
}
