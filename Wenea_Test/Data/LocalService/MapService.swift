//
//  MapService.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Combine
import CoreLocation.CLLocation

protocol MapService {
    func get(params: MapParams) -> AnyPublisher<MapResponse, Error>
}

final class MapServiceImpl: MapService {
    let mock = MockLocations()
    func get(params: MapParams) -> AnyPublisher<MapResponse, Error> {
        Just(mock.getMockLocationsFor(location: params.location, itemCount: params.count))
            .map(MapResponse.init)
            .setFailureType(to: Error.self)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
