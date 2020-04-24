//
//  ProfileViewController.swift
//  The Habit Tracker App
//
//  Created by Kathryn Tatum on 4/17/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var habitArray = ["Wake up at 8am every day", "Go on a run every other day", "Eat 3 servings of vegetables every day", "Call parents once a week", "Call best friend once a week", "Volunteer once a week"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            let destination = segue.destination as! ItemDetailTableViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.habitItem = habitArray[selectedIndexPath.row]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    
    @IBAction func unwindFromDetail(segue: UIStoryboardSegue) {
        let source = segue.source as! ItemDetailTableViewController
        if let selectedIndexPath = tableView.indexPathForSelectedRow {
            habitArray[selectedIndexPath.row] = source.habitItem
            tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
        }
    }
    

}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habitArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(habitArray[indexPath.row])"
        return cell
    }
}
