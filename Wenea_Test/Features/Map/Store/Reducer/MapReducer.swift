//
//  MapReducer.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Foundation
import Combine

final class MapReducer {
    
    func redux(
        state: inout MapState,
        action: MapAction
    ) {
        switch action {
        case .onAppear:
            state = state
                .set(\.mapState.mapCentre, AppConfiguration().defaultMapCoordinates)
                .set(\.mapState.zoom, AppConfiguration().defaultMapZoom)

        case let .setCoordinates(coordinates, zoom):
            state = state
                .set(\.mapState.mapCentre, coordinates)
                .set(\.mapState.zoom, zoom)
                //.set(\.mapState.loading, true)

        case let .setMapInfo(mapInfo):
            state = state
                .set(\.mapState.markers, mapInfo.map(MarkerInfo.init))
                .set(\.mapState.loading, false)
            
        case .setFilter(let type):
            state = state
                .set(\.mapState.filterType, type)
                //.set(\.mapState.loading, true)
        }
    }
}
