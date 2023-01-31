//
//  MapStore.swift
//  Wenea_Test
//
//  Created by eloysn on 29/1/23.
//
import Foundation
import Combine

final class MapStore: ObservableObject {
    private let reducer: MapReducer
    private let middlewares: [MapMiddleware]
    private var cancellables: Set<AnyCancellable> = .init()
    private let queue: DispatchQueue

    @Published var state: MapState

    init(
        mapUseCase: MapUseCase,
        initialState state: MapState = MapState()
    ) {
        self.state = state
        self.queue = DispatchQueue.main
        self.reducer = MapReducer()
        self.middlewares = [
            MapGetInfoMiddleware(mapUseCase: mapUseCase),
            MapFilterMiddleware(mapUseCase: mapUseCase)
        ]
    }

    func dispatch(action: MapAction) {
        reducer.redux(state: &state, action: action)

        middlewares.forEach { middleware in
            guard let middleware = middleware.redux(state: state, action: action, queue: queue)
            else { return }
            middleware
                .receive(on: queue)
                .sink(receiveCompletion: { _ in }, receiveValue: dispatch)
                .store(in: &cancellables)
        }
    }
}

