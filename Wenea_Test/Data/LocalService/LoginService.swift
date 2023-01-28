//
//  LoginService.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine
import Foundation

protocol LoginService {
    func login(params: LoginParams) -> AnyPublisher<LoginResponse, Error>
}

final class LoginServiceImpl: LoginService {
    @UserDefault(.users, defaultValue: [])
    var users: [String]
    func login(params: LoginParams) -> AnyPublisher<LoginResponse, Error> {
        Just(LoginResponse(result: true))
            .handleEvents(receiveOutput: { [weak self] _ in
                guard let self = self else { return }
                self.users = self.users + ["\(params.email)"]
            })
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
