//
//  LoginUseCase.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine

protocol LoginUseCase {
    func login(with user: User) -> AnyPublisher<Bool, Error>
}

final class LoginCaseImpl: LoginUseCase {
    private let authRepository: AuthRepository

    init(
        authRepository: AuthRepository
    ) {
        self.authRepository = authRepository
    }

    func login(with user: User) -> AnyPublisher<Bool, Error> {
        authRepository
            .login(params: LoginParams(email: user.email, password: user.password))
            .eraseToAnyPublisher()
    }
}
