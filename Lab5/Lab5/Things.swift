//
//  Things.swift
//  Lab5
//
//  Created by CU Boulder on 3/19/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import Foundation
import Firebase

class Things: Codable {
    var thing1: String
    var thing2: String
    var thing3: String
    var time: String


    init(newnote1: String, newnote2: String, newnote3: String, newtime:String) {
        thing1 = newnote1
        thing2 = newnote2
        thing3 = newnote3
        time = newtime
    }
}

