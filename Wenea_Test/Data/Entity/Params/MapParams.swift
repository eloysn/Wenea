//
//  MapParams.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import CoreLocation.CLLocation

struct MapParams {
    let location: CLLocation
    let count: Int
    let filter: MapElementType?
}
