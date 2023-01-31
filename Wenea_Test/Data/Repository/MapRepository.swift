//
//  MapRepository.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Combine

protocol MapRepository {
    func get(params: MapParams) -> AnyPublisher<MapElements, Error>
}

final class MapRepositoryImpl: MapRepository {
    private let mapService: MapService

    public init(
        mapService: MapService
    ) {
        self.mapService = mapService
    }

    public func get(params: MapParams) -> AnyPublisher<MapElements, Error> {
        guard let filterType = params.filter else {
            return mapService.get(params: params)
                .map(MapElements.init)
                .eraseToAnyPublisher()
        }
        return mapService.get(params: params)
            .map(MapElements.init)
            .map { map in map.filter { $0.type == filterType }}
            .eraseToAnyPublisher()
    }
}
