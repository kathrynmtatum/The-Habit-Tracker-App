//
//  BrowseDetailViewController.swift
//  The Habit Tracker App
//
//  Created by Kathryn Tatum on 4/17/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import UIKit

class BrowseDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        let isPresentingFromBrowseScreen = presentingViewController is BrowseViewController
        if isPresentingFromBrowseScreen {
            dismiss(animated: true, completion: nil)
        } else {
            dismiss(animated: true, completion: nil)
        }
    }
    

}
