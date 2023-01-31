//
//  LoginService.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine
import Foundation
//Auth
protocol AuthService {
    func login(params: LoginParams) -> AnyPublisher<LoginResponse, Error>
}

final class LoginServiceImpl: AuthService {
    @UserDefault(.users, defaultValue: [])
    var users: [String]
    func login(params: LoginParams) -> AnyPublisher<LoginResponse, Error> {
        Just(LoginResponse(result: users.contains(where: { $0 == params.email })))
            .setFailureType(to: Error.self)
            .delay(for: 2, scheduler: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
