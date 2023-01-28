//
//  Wenea_App.swift
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI

@main
struct Wenea_App: App {
    var body: some Scene {
        WindowGroup {
            LoginView(loginViewModel: LoginViewModel())
        }
    }
}
