//
//  AppDelegate.swift
//  localizationDemo
//
//  Created by Akash on 28/05/24.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customisation after application launch.
        FirebaseApp.configure()
        print(Bundle.main.localizations)
        checkLocalisation()
        return true
    }
    
    func checkLocalisation(){
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
            
        })
        if let _ = UserDefaults.standard.string(forKey: "selectedLanguage"){
//            return
        }
        setDefaultLanguage()
    }
    
    func setDefaultLanguage(){
        let preferredLanguage = Locale.preferredLanguages.first ?? "en"
        let arr = preferredLanguage.split(separator: "-")
        let defaultLanguage = arr.first
        
        let supportedLanguage = Bundle.main.localizations
        if supportedLanguage.contains(where: { $0 == defaultLanguage ?? "en" }){
            UserDefaults.standard.setValue(defaultLanguage, forKey: "selectedLanguage")
        } else {
            UserDefaults.standard.setValue("en", forKey: "selectedLanguage")
        }
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

