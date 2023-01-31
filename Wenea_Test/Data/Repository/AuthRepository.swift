//
//  LoginRepository.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine
 
protocol AuthRepository {
    func login(params: LoginParams) -> AnyPublisher<Bool, Error>
    func register(params: RegisterParams) -> AnyPublisher<Bool, Error>
}

final class AuthRepositoryImpl: AuthRepository {
    private let authService: AuthService
    
    public init(
        authService: AuthService
    ) {
        self.authService = authService
    }

    func login(params: LoginParams) -> AnyPublisher<Bool, Error> {
        authService.login(params: params)
            .map { $0.result }
            .eraseToAnyPublisher()
    }
    
    func register(params: RegisterParams) -> AnyPublisher<Bool, Error> {
        authService.register(params: params)
            .map { $0.result }
            .eraseToAnyPublisher()
    }
}

