//
//  AppDelegate.swift
//  Bus stops
//
//  Created by Даниил Пасилецкий on 14.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: App Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Saving data about the screen that was last opened.
        var isStop = false
        // Router.currentStop = nil if the application closed on the screen with a list of stops.
        if let stop = Router.currentStop {
            isStop = true
            UserDefaults.standard.set(stop.id, forKey: "currentStopId")
            UserDefaults.standard.set(stop.name, forKey: "currentStopName")
            UserDefaults.standard.set(stop.lat, forKey: "currentStopLat")
            UserDefaults.standard.set(stop.lon, forKey: "currentStopLon")
        }
        UserDefaults.standard.set(isStop, forKey: "OpenStop")
        print("Stop save: \(String(describing: Router.currentStop))")
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

