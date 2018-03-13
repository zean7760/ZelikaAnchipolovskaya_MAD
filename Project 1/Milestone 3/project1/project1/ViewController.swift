//
//  ADDViewController.swift
//  project1
//
//  Created by CU Boulder on 3/3/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UITextFieldDelegate  {
    var addedNote = String()
    var addedType = String()
    var addedSets = String()
    var addedReps = String()
    
    var addedTime = String()
    //var dateFormatter : DateFormatter!
    
    

    @IBOutlet weak var workoutNote: UITextView!
    
    @IBOutlet weak var repNumber: UITextField!
    @IBOutlet weak var setNumber: UITextField!
    @IBOutlet weak var selectedSegType: UISegmentedControl!
    
    @IBOutlet weak var picker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addedType = "Cardio"
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "MM/dd/yy h:mm a"
        addedTime = dateformatter.string(from: NSDate() as Date)
        
        repNumber.delegate = self
        repNumber.tag = 1 //Increment accordingly
        repNumber.returnKeyType = UIReturnKeyType.next
        setNumber.delegate = self
        setNumber.tag = 0 //Increment accordingly
        setNumber.returnKeyType = UIReturnKeyType.next
        workoutNote.delegate = self as? UITextViewDelegate
        workoutNote.tag = 2 //Increment accordingly
        workoutNote.returnKeyType = UIReturnKeyType.default
        workoutNote!.layer.borderWidth = 1
        //workoutNote!.layer.borderColor = UIColor.black().GColor
       
      
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
                _ = addedTime
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
