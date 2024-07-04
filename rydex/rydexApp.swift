//
//  rydexApp.swift
//  rydex
//
//  Created by elluminati on 24/06/24.
//

import SwiftUI
import GoogleMaps

@main
struct rydexApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyDp91J5Ol5m3Oa_RcdcT6t5ffhB1cgT4hc")
        return true
    }
}
