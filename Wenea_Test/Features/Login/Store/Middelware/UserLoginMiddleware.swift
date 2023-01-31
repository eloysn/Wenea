//
//  UserLoginMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine
import Dispatch

final class UserLoginMiddleware: LoginMiddleware {
    private let loginUseCase: LoginUseCase

    init(
        loginUseCase: LoginUseCase
    ) {
        self.loginUseCase = loginUseCase
    }

    func redux(
        state: LoginState,
        action: LoginAction,
        queue: DispatchQueue
    ) -> AnyPublisher<LoginAction, Error>? {
        guard case let .onLogin(email, pass) = action else { return nil }
        guard !email.isEmpty && !pass.isEmpty  else {
            return Just(.onFailedLogin(message: "Email or Pass invalid"))
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        return loginUseCase.login(with: User(name: "", email: email, password: pass))
            .map {
                switch $0 {
                case true: return .onUserLoged
                case false: return .onFailedLogin(message: "User not registered")
                }
            }.eraseToAnyPublisher()
    }
}
