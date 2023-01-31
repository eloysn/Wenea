//
//  WeneaApp.swift
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI

@main
struct WeneaApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LoginView(store: LoginStore(loginUseCase: DomainContainerDIImpl.shared.loginUseCase))
        }
    }
}
