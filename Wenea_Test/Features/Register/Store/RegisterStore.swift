//
//  RegisterStore.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import SwiftUI
import Combine

final class RegisterStore: ObservableObject {
    private let reducer: RegisterReducer
    private let middlewares: [RegisterMiddleware]
    private var cancellables: Set<AnyCancellable> = .init()
    private let queue: DispatchQueue

    @Published var state: RegisterState
    init(
        registerUseCase: RegisterUseCase,
        initialState: RegisterState = RegisterState()
    ) {
        self.state = initialState
        self.reducer = RegisterReducer()
        self.middlewares = [
            UserRegisterMiddleware(registerUseCase: registerUseCase)
        ]
        self.queue = DispatchQueue.main
    }
    func dispatch(action: RegisterAction) {
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

