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
    private let loginRepository: LoginRepository

    public init(
        loginRepository: LoginRepository
    ) {
        self.loginRepository = loginRepository
    }

    func login(with user: User) -> AnyPublisher<Bool, Error> {
        loginRepository
            .login(params: LoginParams(email: user.email, password: user.password))
            .eraseToAnyPublisher()
    }
}
