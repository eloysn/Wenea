//
//  GoogleMapsViewState.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Foundation

struct GoogleMapsViewState: Modifiable {
    var mapCentre: Coordinates?
    var zoom: Float?
    var markers: [MarkerInfo] = []
    var filterType: MarkerInfoType?
    var loading: Bool = false
}


