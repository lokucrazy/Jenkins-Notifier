//
//  JenkinsTableViewController.swift
//  JenkinsNotifier
//
//  Created by Ryan Lokugamage on 8/24/19.
//  Copyright © 2019 Ryan Lokugamage. All rights reserved.
//

import UIKit
import RealmSwift

class JenkinsTableViewController: UITableViewController {
    var jenkinsProjectList: Results<JenkinsProject>?
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = try! Realm()
        jenkinsProjectList = realm.objects(JenkinsProject.self)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jenkinsProjectList?.count ?? 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jenkinsProject", for: indexPath)
        if let project = jenkinsProjectList?[indexPath.row] {
            cell.textLabel?.text = project.name
            cell.detailTextLabel?.text = project.url?.absoluteString
        }
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("Got to segue")
        if let destination = segue.destination as? JenkinsProjectTableViewController {
            if segue.identifier == "segueBuilds", let index = tableView.indexPathForSelectedRow {
                if let project = jenkinsProjectList?[index.row] {
                    destination.buildList = project.retrieveRecentBuilds()
                }
            }
        }
    }
    
}
