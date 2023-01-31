//
//  MapMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//

import Dispatch
import Combine

protocol MapMiddleware  {
    func redux(
        state: MapState,
        action: MapAction,
        queue: DispatchQueue
    ) -> AnyPublisher<MapAction, Error>?
}
