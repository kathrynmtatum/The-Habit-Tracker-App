//
//  BrowseViewController.swift
//  The Habit Tracker App
//
//  Created by Kathryn Tatum on 4/17/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class BrowseViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories = ["Nutrition", "Exercise", "Sleep", "Productivity", "Emotional/Spiritual", "Social Relationships", "Career"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension BrowseViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(categories[indexPath.row])"
        return cell
    }
    
    
}
