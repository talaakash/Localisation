//
//  SettingVC.swift
//  localizationDemo
//
//  Created by Akash on 29/05/24.
//

import UIKit

class SettingVC: UIViewController {

    @IBOutlet weak var labelText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabelText()
    }
    
    private func setLabelText() {
//        RemoteConfigManager.shared.fetchRemoteConfig(completion: { isSuccessful in
//            if isSuccessful{
//                let labelValue = RemoteConfigManager.shared.getString(forKey: "SettingLabel")
//                DispatchQueue.main.async {
//                    self.labelText.text = labelValue
//                }
//            }
//        })
    }
    
    @IBAction func backBtnClicked(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectLanguage(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "AppLanguageVC") as! AppLanguageVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
