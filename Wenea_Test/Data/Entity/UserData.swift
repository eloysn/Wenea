//
//  UserData.swift
//  Wenea_Test
//
//  Created by eloysn on 30/1/23.
//

import Foundation

struct UserData: Codable {
    let name: String
    let email: String
    let pass: String
    
    init(params: RegisterParams) {
        self.name = params.name
        self.email = params.email
        self.pass = params.password
    }
}

