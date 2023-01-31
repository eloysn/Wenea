//
//  MapFilterMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import Combine
import Dispatch

final class MapFilterMiddleware: MapMiddleware {
    private let mapUseCase: MapUseCase

    init(
        mapUseCase: MapUseCase
    ) {
        self.mapUseCase = mapUseCase
    }

    func redux(
        state: MapState,
        action: MapAction,
        queue: DispatchQueue
    ) -> AnyPublisher<MapAction, Error>? {
        switch action {
        case .setFilter(let filterType):
            guard let coordinates = state.mapState.mapCentre else { break }
            return mapUseCase.getMapInfo(coordinates: coordinates, filter: filterType)
                .receive(on: queue)
                .map { .setMapInfo($0) }
                .eraseToAnyPublisher()
        default: break
        }

        return nil
    }
}
