//
//  AppLanguageVC.swift
//  localizationDemo
//
//  Created by Akash on 29/05/24.
//

import UIKit

class AppLanguageVC: UIViewController {
    
    @IBOutlet weak var languageTbl: UITableView!
    let languages = Bundle.main.localizations
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup(){
        languageTbl.register(UINib(nibName: "LanguageCell", bundle: nil), forCellReuseIdentifier: "LanguageCell")
    }
    

    
}

extension AppLanguageVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return languages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath) as! LanguageCell
        cell.languageName.text = languages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Bundle.setLanguage(languages[indexPath.row])
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
            DispatchQueue.main.async {
                // MARK: Go to home vc
                let vc = self.storyboard?.instantiateViewController(identifier: "HomeVC") as! HomeVC
                self.navigationController?.viewControllers = [vc]
            }
        })
    }
}


//    @IBAction func englishBtnTapped(_ sender: UIButton){
//        Bundle.setLanguage("en")
//        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
////            NotificationCenter.default.post(name: .triggerFunction, object: nil)
//        })
//        self.navigationController?.popViewController(animated: true)
//    }
//
//    @IBAction func spanishBtnTapped(_ sender: UIButton){
//        Bundle.setLanguage("es")
//        RemoteConfigManager.shared.fetchRemoteConfig(completion: { _ in
////            NotificationCenter.default.post(name: .triggerFunction, object: nil)
//        })
//        self.navigationController?.popViewController(animated: true)
//    }
