//
//  SettingVC.swift
//  localizationDemo
//
//  Created by Akash on 29/05/24.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var languageBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
            let json = RemoteConfigManager.shared.getValue(forKey: "SettingJson")
            DispatchQueue.main.async {
                self.labelText.text = json["title"]
                self.languageBtn.setTitle(json["BtnLabel"], for: .normal)
            }
        })
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectLanguage(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "AppLanguageVC") as! AppLanguageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
