//
//  LoginStore.swift
//  Wenea_Test
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI
import Combine

final class LoginStore: ObservableObject {
    private let reducer: LoginReducer
    private let middlewares: [LoginMiddleware]
    private var cancellables: Set<AnyCancellable> = .init()
    private let queue: DispatchQueue

    @Published var state: LoginState
    init(
        loginUseCase: LoginUseCase,
        initialState: LoginState = LoginState()
    ) {
        self.state = initialState
        self.reducer = LoginReducer()
        self.middlewares = [
            UserLoginMiddleware(loginUseCase: loginUseCase)
        ]
        self.queue = DispatchQueue.main
    }
    func dispatch(action: LoginAction) {
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
