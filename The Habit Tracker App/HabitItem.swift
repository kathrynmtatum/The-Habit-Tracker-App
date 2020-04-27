//
//  HabitItem.swift
//  The Habit Tracker App
//
//  Created by Kathryn Tatum on 4/27/20.
//  Copyright © 2020 Kathryn Tatum. All rights reserved.
//

import Foundation

struct habitItem: Codable {
    var name: String
    var notes: String
    var date: Date
}
