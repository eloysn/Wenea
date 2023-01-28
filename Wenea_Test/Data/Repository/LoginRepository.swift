//
//  LoginRepository.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine

protocol LoginRepository {
    func login(params: LoginParams) -> AnyPublisher<Bool, Error>
}

final class LoginRepositoryImpl: LoginRepository {
    private let loginService: LoginService
    
    public init(
        loginService: LoginService
    ) {
        self.loginService = loginService
    }

    func login(params: LoginParams) -> AnyPublisher<Bool, Error> {
        loginService.login(params: params)
            .map { $0.result }
            .eraseToAnyPublisher()
    }
}

