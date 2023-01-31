//
//  RegisterReducer.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import Combine

final class RegisterReducer {
    
    func redux(
        state: inout RegisterState,
        action: RegisterAction
    ) {
        switch action {
        case .onUserRegister:
            state = state
                .set(\.loading, false)
                .set(\.userRegister, true)
        case .onRegister:
            state = state
                .set(\.loading, true)
                .set(\.messageError, nil)
        case .onFailedRegister(let error):
            state = state
                .set(\.loading, false)
                .set(\.messageError, error)
                .set(\.userRegister, false)
        }
    }
}

