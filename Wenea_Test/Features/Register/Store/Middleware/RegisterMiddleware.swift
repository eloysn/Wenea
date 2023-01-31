//
//  RegisterMiddleware.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import Combine
import Dispatch

protocol RegisterMiddleware  {
    func redux(
        state: RegisterState,
        action: RegisterAction,
        queue: DispatchQueue
    ) -> AnyPublisher<RegisterAction, Error>?
}
