//
//  MapGetInfoMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Combine
import Dispatch

final class MapGetInfoMiddleware: MapMiddleware {
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
        case .setCoordinates(let coordinates, _ ):
            return mapUseCase.getMapInfo(coordinates: coordinates, filter: state.mapState.filterType)
                .receive(on: queue)
                .map { .setMapInfo($0) }
                .eraseToAnyPublisher()
        default: break
        }

        return nil
    }
}

