//
//  MapAction.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//


enum MapAction {
    case onAppear
    case setCoordinates(_ coordinates: Coordinates, zoom: Float)
    case setMapInfo(_ mapInfo: [MapElement])
    case setFilter(type: MarkerInfoType?)
}
