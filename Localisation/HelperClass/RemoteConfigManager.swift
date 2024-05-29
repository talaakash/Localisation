//
//  RemoteConfigManager.swift
//  localizationDemo
//
//  Created by Akash on 28/05/24.
//

import Foundation
import FirebaseRemoteConfig
import FirebaseAnalytics

class RemoteConfigManager {
    static let shared = RemoteConfigManager()
    private var remoteConfig: RemoteConfig!

    private init() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0 // Fetch interval in seconds
        remoteConfig.configSettings = settings
        remoteConfig.setDefaults(fromPlist: "RemoteConfigDefaults")
    }

    func fetchRemoteConfig(completion: @escaping (Bool) -> Void) {
        remoteConfig.fetch { status, error in
            if status == .success {
                self.remoteConfig.activate { changed, error in
                    completion(true)
                }
            } else {
                completion(false)
            }
        }
    }
    
    func getString(forKey key: String) -> String{
        return remoteConfig.configValue(forKey: key).stringValue ?? ""
    }

    func getValue(forKey key: String) -> [String: String] {
        let remoteConfigData = remoteConfig.configValue(forKey: key).jsonValue as? [String: String] ?? [:]
        return remoteConfigData
    }
}
