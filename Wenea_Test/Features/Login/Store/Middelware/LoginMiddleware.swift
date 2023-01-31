//
//  LoginMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//


import Combine
import Dispatch

protocol LoginMiddleware  {
    func redux(
        state: LoginState,
        action: LoginAction,
        queue: DispatchQueue
    ) -> AnyPublisher<LoginAction, Error>?
}
