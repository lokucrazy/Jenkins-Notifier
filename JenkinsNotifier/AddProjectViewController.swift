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
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addProject(_ sender: Any) {
        let realm = try! Realm()
        try! realm.write {
            if let name = projectLocationField?.text, let location = projectLocationField?.text {
                if let url = URL(string: location) {
                    realm.add(JenkinsProject(name, url))
                }
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
