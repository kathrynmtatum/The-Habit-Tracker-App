//
//  BrowseDetailViewController.swift
//  The Habit Tracker App
//
//  Created by Kathryn Tatum on 4/17/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class BrowseDetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var selection: String!
    
    var habit: [String] = []
    var nutritionHabits = ["Eat more fruit", "Eat more vegetables", "Eat more protein"]
    var exerciseHabits = ["Run every day", "Lift weights", "Work on endurance", "Improve arm strength", "Work on abs", "Run a faster mile", "Practice push-ups"]
    var sleepHabits = ["Go to sleep earlier", "Wake up earlier", "Get 8 hours of sleep"]
    var productivityHabits = ["Check email", "2 hours of uninturrupted work", "Less procrastination", "Put phone away while working", "Use a planner", "Start work early", "Get 3 assignments done each day"]
    var emotionalHabits = ["Mindfulness", "Yoga", "Take a walk", "Journal", "Call a friend", "Read a good book"]
    var socialHabits = ["Call friends", "Call family"]
    var careerHabits = ["Be on time", "Dress professionally", "Network"]

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        switch selection {
        case "Nutrition" :
            habit = nutritionHabits
        case "Exercise" :
            habit = exerciseHabits
        case "Sleep" :
            habit = sleepHabits
        case "Productivity" :
            habit = productivityHabits
        case "Self Care" :
            habit = emotionalHabits
        case "Social Relationships" :
            habit = socialHabits
        case "Career" :
            habit = careerHabits
        default:
            print("*** ERROR: No habits to display")
        }

    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        let isPresentingFromBrowseScreen = presentingViewController is BrowseViewController
        if isPresentingFromBrowseScreen {
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditGoal" {
            let destination = segue.destination as! ItemDetailTableViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.habitItem = habit[selectedIndexPath.row]
        } else {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndexPath, animated: true)
            }
        }
    }
    

}

extension BrowseDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habit.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "\(habit[indexPath.row])"
        return cell
    }
    
    
}
