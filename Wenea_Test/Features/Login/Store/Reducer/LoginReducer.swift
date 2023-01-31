//
//  LoginReducer.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

import Combine

final class LoginReducer {
    
    func redux(
        state: inout LoginState,
        action: LoginAction
    ) {
        switch action {
        case .onLogin:
            state = state
                .set(\.loading, true)
                .set(\.messageError, nil)
        case .onUserLoged:
            state = state
                .set(\.loading, false)
                .set(\.userLoged, true)
        case let .onFailedLogin(error):
            state = state
                .set(\.loading, false)
                .set(\.messageError, error)
                .set(\.userLoged, false)
        }
    }
}
