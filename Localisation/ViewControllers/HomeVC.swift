//
//  HomeVC.swift
//  localizationDemo
//
//  Created by Akash on 29/05/24.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        setHomeLabels()
    }
    
    private func setHomeLabels() {
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { isSuccessful in
            if isSuccessful{
                let labelValue = RemoteConfigManager.shared.getString(forKey: "HomeLabel")
                DispatchQueue.main.async {
                    self.homeLabel.text = labelValue
                }
            }
        })
    }
    
    
    
    @IBAction func settingBtnClicked(_ sender: UIButton){
        let vc = storyboard?.instantiateViewController(identifier: "SettingVC") as! SettingVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
