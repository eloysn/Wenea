//
//  LoginRepository.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine

protocol AuthRepository {
    func login(params: LoginParams) -> AnyPublisher<Bool, Error>
}

final class LoginRepositoryImpl: AuthRepository {
    private let loginService: AuthService
    
    public init(
        loginService: AuthService
    ) {
        self.loginService = loginService
    }

    func login(params: LoginParams) -> AnyPublisher<Bool, Error> {
        loginService.login(params: params)
            .map { $0.result }
            .eraseToAnyPublisher()
    }
}

