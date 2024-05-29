//
//  ViewController.swift
//  localizationDemo
//
//  Created by Akash on 28/05/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var fistNameLbl: UILabel!
    @IBOutlet weak var lastNameLbl: UILabel!
    @IBOutlet weak var segmentController: UISegmentedControl!
    @IBOutlet weak var lblTry:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lan = UserDefaults.standard.value(forKey: "selectedLanguage")
        lblTry.text = "try".localizeString(loc: lan as! String)
        
        RemoteConfigManager.shared.fetchRemoteConfig(completion: { isSuccessFull in
            if isSuccessFull{
                let json = RemoteConfigManager.shared.getValue(forKey: "labelData")
                print(json)
                DispatchQueue.main.async {
                    if json["FirstNameKey"] != "FirstName"{
                        self.segmentController.selectedSegmentIndex = 1
                    }
                    self.fistNameLbl.text = json["FirstNameKey"]
                    self.lastNameLbl.text = json["LastNameKey"]
                }
            }
        })
    }

    
    @IBAction func languageChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{ // English
            Bundle.setLanguage("en")
            RemoteConfigManager.shared.fetchRemoteConfig(completion: { isSuccessFull in
                if isSuccessFull{
                    let json = RemoteConfigManager.shared.getValue(forKey: "labelData")
                    print(json)
                    DispatchQueue.main.async {
                        self.fistNameLbl.text = json["FirstNameKey"]
                        self.lastNameLbl.text = json["LastNameKey"]
                    }
                }
            })
        } else { // Spanish
            Bundle.setLanguage("es")
            
            RemoteConfigManager.shared.fetchRemoteConfig(completion: { isSuccessFull in
                if isSuccessFull{
                    let json = RemoteConfigManager.shared.getValue(forKey: "labelData")
                    print(json)
                    DispatchQueue.main.async {
                        self.fistNameLbl.text = json["FirstNameKey"]
                        self.lastNameLbl.text = json["LastNameKey"]
                    }
                }
            })
        }
        let lan = UserDefaults.standard.value(forKey: "selectedLanguage")
        lblTry.text = "try".localizeString(loc: lan as! String)
    }
    
    
}

extension String{
    func localizeString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, bundle: bundle!, comment: "")
    }
}

extension Bundle {
    static func setLanguage(_ languageCode: String) {
        UserDefaults.standard.set([languageCode], forKey: "AppleLanguages")
        UserDefaults.standard.setValue(languageCode, forKey: "selectedLanguage")
        UserDefaults.standard.synchronize()
    }
}
