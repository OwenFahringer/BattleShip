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
    @StateObject var bbvm: BoardBuilderViewModel = BoardBuilderViewModel()
    @StateObject var msvm: MoveSelectVM = MoveSelectVM()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(ID: .constant(""))
                    .environmentObject(bbvm)
                    .environmentObject(msvm)
            }
        }
    }
}
