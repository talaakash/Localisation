//
//  AppLanguageVC.swift
//  localizationDemo
//
//  Created by Akash on 29/05/24.
//

import UIKit

class AppLanguageVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func englishBtnTapped(_ sender: UIButton){
        Bundle.setLanguage("en")
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
//            NotificationCenter.default.post(name: .triggerFunction, object: nil)
        })
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func spanishBtnTapped(_ sender: UIButton){
        Bundle.setLanguage("es")
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
//            NotificationCenter.default.post(name: .triggerFunction, object: nil)
        })
        self.navigationController?.popViewController(animated: true)
    }
    
}
