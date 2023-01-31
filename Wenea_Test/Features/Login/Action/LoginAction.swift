//
//  LoginAction.swift
//  Wenea_Test
//
//  Created by eloysn on 28/1/23.
//

enum LoginAction {
    case onLogin(email: String, pass: String)
    case onUserLoged
    case onFailedLogin(message: String)
}
