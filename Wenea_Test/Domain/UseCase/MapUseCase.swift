//
//  MapUseCase.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Combine
import CoreLocation.CLLocation

protocol MapUseCase {
    func getMapInfo(coordinates: Coordinates, filter: MarkerInfoType?) -> AnyPublisher<MapElements, Error>
}

final class MapUseCaseImpl: MapUseCase {
    private let mapRepository: MapRepository

    init(
        mapRepository: MapRepository
    ) {
        self.mapRepository = mapRepository
    }

    func getMapInfo(coordinates: Coordinates, filter: MarkerInfoType?) -> AnyPublisher<MapElements, Error> {
        mapRepository.get(params: MapParams(
            location: coordinates.toCLLocation,
            count: Int.random(in: 150...300),
            filter: filter?.asElementType))
    }
}

