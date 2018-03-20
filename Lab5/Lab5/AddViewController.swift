//
//  AddViewController.swift
//  Lab5
//
//  Created by CU Boulder on 3/19/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import Firebase

class AddViewController: UIViewController {
    
    @IBOutlet weak var note3: UITextField!
    @IBOutlet weak var note2: UITextField!
    @IBOutlet weak var note1: UITextField!
    
    var addednote1 = String()
    var addednote2 = String()
    var addednote3 = String()
    var addedTime = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yy h:mm a"
        addedTime = dateformatter.string(from: NSDate() as Date)

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savesegue" {
            if note1.text?.isEmpty == false {
                addednote1 = note1.text!
                addednote2 = note2.text!
                addednote3 = note3.text!
                _ = addedTime
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
