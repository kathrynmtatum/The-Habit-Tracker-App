//
//  ItemDetailTableViewController.swift
//  The Habit Tracker App
//
//  Created by Kathryn Tatum on 4/17/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class ItemDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var noteView: UITextView!
    
    var habitItem: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if habitItem == nil {
            habitItem = ""
        }
        nameField.text = habitItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        habitItem = nameField.text
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        let isPresentingFromProfile = presentingViewController is ProfileViewController
        if isPresentingFromProfile {
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
}
