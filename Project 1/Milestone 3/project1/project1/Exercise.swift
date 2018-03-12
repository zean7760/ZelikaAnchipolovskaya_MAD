//
//  workouts.swift
//  project1
//
//  Created by CU Boulder on 3/8/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import Foundation
import Firebase

class Exercise: Codable {
    var type: String
    var sets: String
    var reps: String
    var notes: String
    
    
    init(newtype: String, newnotes: String, newsets: String, newreps: String) {
        type = newtype
        sets = newsets
        reps = newreps
        notes = newnotes
    }
}
