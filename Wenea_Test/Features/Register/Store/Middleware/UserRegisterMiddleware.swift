//
//  UserRegisterMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import Combine
import Dispatch

final class UserRegisterMiddleware: RegisterMiddleware {
    private let registerUseCase: RegisterUseCase

    init(
        registerUseCase: RegisterUseCase
    ) {
        self.registerUseCase = registerUseCase
    }

    func redux(
        state: RegisterState,
        action: RegisterAction,
        queue: DispatchQueue
    ) -> AnyPublisher<RegisterAction, Error>? {
        guard case let .onRegister(user) = action else { return nil }
        guard !user.email.isEmpty && !user.password.isEmpty && !user.name.isEmpty else {
            return Just(.onFailedRegister(message: "Name or Email or Pass invalid"))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        return registerUseCase.register(with: user)
            .map {
                switch $0 {
                case true: return .onUserRegister
                case false: return .onFailedRegister(message: "User logged in the system")
                }
            }.eraseToAnyPublisher()
    }
}
