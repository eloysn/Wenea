//
//  AppDelegate.swift
//  Wenea_Test
//
//  Created by eloysn on 31/1/23.
//

import GoogleMaps

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
