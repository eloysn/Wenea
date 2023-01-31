//
//  Wenea_App.swift
//
//  Created by eloysn on 27/1/23.
//

import SwiftUI
import GoogleMaps

@main
struct Wenea_App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            LoginView(store: LoginStore(loginUseCase: DomainContainerDIImpl.shared.loginUseCase))
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        initGoogleMapsApiKey()
        return true
    }
}

private extension AppDelegate {
    func initGoogleMapsApiKey() {
        GMSServices.provideAPIKey(AppConfiguration().gMapsApiKey)
    }
}
