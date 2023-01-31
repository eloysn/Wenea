//
//  RegisterAction.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

enum RegisterAction {
    case onRegister(user: User)
    case onUserRegister
    case onFailedRegister(message: String)
}
