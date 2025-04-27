//
//  BattleShipApp.swift
//  BattleShip
//
//  Created by Owen F on 3/31/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct BattleShipApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {@UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
        WindowGroup {
            NavigationView{
                ContentView()
            }
        }
    }
}
