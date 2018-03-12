//
//  ADDViewController.swift
//  project1
//
//  Created by CU Boulder on 3/3/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var workoutNote: UITextView!
    
    @IBOutlet weak var repNumber: UITextField!
    @IBOutlet weak var setNumber: UITextField!
    @IBOutlet weak var selectedSegType: UISegmentedControl!
    
    var addedNote = String()
    var addedType = String()
    var addedSets = String()
    var addedReps = String()
    
   
    
    override func viewDidLoad() {
        addedType = "Cardio"
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func segmentedType(_ sender: UISegmentedControl) {
        
        addedType = sender.titleForSegment(at: sender.selectedSegmentIndex)!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "savesegue" {
            if workoutNote.text?.isEmpty == false {
            
                addedNote = workoutNote.text!
                _ = addedType
                addedReps = repNumber.text!
                addedSets = setNumber.text!
                
            }
        }
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
