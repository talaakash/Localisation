//
//  LanguageDemo.swift
//  localizationDemo
//
//  Created by Akash on 28/05/24.
//

import UIKit

class LanguageDemo: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let selectedLanguage = UserDefaults.standard.string(forKey: "selectedLanguage")!
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { isSuccessful in
            if isSuccessful{
                print(RemoteConfigManager.shared.getString(forKey: "version"))
//                let json = RemoteConfigManager.shared.getValue(forKey: selectedLanguage)
//                DispatchQueue.main.async {
//                    self.label.text = json["name"]
//                }
            }
        })
    }

}
