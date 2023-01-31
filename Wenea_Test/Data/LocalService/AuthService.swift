//
//  LoginService.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine
import Foundation

protocol AuthService {
    func login(params: LoginParams) -> AnyPublisher<AuthResponse, Error>
    func register(params: RegisterParams) -> AnyPublisher<AuthResponse, Error>
    var users: [UserData] { get set }
}

final class AuthServiceImpl: AuthService {
    @UserDefaultCodable(key: .users, defaultValue: [])
    var users: [UserData]
    func login(params: LoginParams) -> AnyPublisher<AuthResponse, Error> {
        Just(AuthResponse(result: users.contains(where: { $0.email == params.email })))
            .setFailureType(to: Error.self)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    func register(params: RegisterParams) -> AnyPublisher<AuthResponse, Error> {
        let result = !(users.contains(where: { $0.email == params.email  }))
        return Just(AuthResponse(result: result))
            .handleEvents(receiveSubscription: { _ in },
                          receiveOutput: { [weak self] _ in self?.users.append(UserData(params: params)) })
            .setFailureType(to: Error.self)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
