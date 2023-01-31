//
//  RegisterUseCase.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import Combine

protocol RegisterUseCase {
    func register(with user: User) -> AnyPublisher<Bool, Error>
}

final class RegisterUseCaseImpl: RegisterUseCase {
    private let authRepository: AuthRepository

    init(
        authRepository: AuthRepository
    ) {
        self.authRepository = authRepository
    }

    func register(with user: User) -> AnyPublisher<Bool, Error> {
        authRepository
            .register(params: RegisterParams(name: user.name, email: user.email, password: user.password))
            .eraseToAnyPublisher()
    }
}
