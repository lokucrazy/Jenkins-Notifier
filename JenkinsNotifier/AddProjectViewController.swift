//
//  AddProjectViewController.swift
//  JenkinsNotifier
//
//  Created by Ryan Lokugamage on 8/25/19.
//  Copyright © 2019 Ryan Lokugamage. All rights reserved.
//

import UIKit
import RealmSwift

class AddProjectViewController: UIViewController {
    @IBOutlet weak var projectNameField: UITextField!
    @IBOutlet weak var projectLocationField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func addProject(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            if let name = projectNameField?.text, let location = projectLocationField?.text {
                if let url = validate(url: location){
                    realm.add(JenkinsProject(name, url))
                    self.performSegue(withIdentifier: "submitProject", sender: self)
                }
            }
        }
    }
    
    func validate(url: String) -> URL? {
        guard url.count > 7 else {
            return nil
        }
        
        let index = url.index(url.startIndex, offsetBy: 7)
        if url[..<index] == "http://" {
            let api1 = url.index(url.endIndex, offsetBy: -4)
            let api2 = url.index(url.endIndex, offsetBy: -5)
            if url[api1...] == "/api" || url[api2...] == "/api/" {
                return URL(string: url)
            } else {
                return URL(string: url + "/api")
            }
        }
        return nil
    }
}
