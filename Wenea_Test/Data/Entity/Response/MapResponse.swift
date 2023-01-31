//
//  MapResponse.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import CoreLocation.CLLocation
import Foundation

struct MapResponse {
    let elements: [MapElementResponse]
    init(locations: [CLLocation]) {
        self.elements = locations.map { MapElementResponse(coodinates: $0,
                                                           type: MapTypeResponse.allCases.randomElement() ?? .car)}
    }
}

struct MapElementResponse {
    let coodinates: CLLocation
    let type: MapTypeResponse
}

enum MapTypeResponse: String, CaseIterable {
    case car, bicycle, plane, train
}
