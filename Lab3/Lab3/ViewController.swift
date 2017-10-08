//
//  ViewController.swift
//  Lab3
//
//  Created by CU Boulder on 10/7/17.
//  Copyright © 2017 ATLAS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    @IBOutlet weak var checkAmount: UITextField!
    @IBOutlet weak var tipPercent: UITextField!
    @IBOutlet weak var people: UITextField!
    @IBOutlet weak var tipDue: UILabel!
    @IBOutlet weak var totalDue: UILabel!
    @IBOutlet weak var totalDuePerPerson: UILabel!
    
    @IBAction func onTapGestureRecognized(_ sender: AnyObject) {
        checkAmount.resignFirstResponder()
        tipPercent.resignFirstResponder()
        people.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func updateTipTotals(){
        var amount: Float // check amount
        var pct:Float //Tip%
        
        if checkAmount.text!.isEmpty {
            amount = 0.0
        }else{
            amount = Float(checkAmount.text!)!
        }
        if tipPercent.text!.isEmpty {
            pct = 0.0
        }else{
            pct = Float(tipPercent.text!)!/100
        }
        
        let numberOfPeople = Int(people.text!)
        let tip = amount * pct
        let total = amount + tip
        
        var personTotal: Float = 0.0
        
        if numberOfPeople != nil{
            if numberOfPeople! > 0{
                personTotal = total / Float(numberOfPeople!)
            }else{
                // creating UIAlertController object
                let alert=UIAlertController(title: "Warning", message: "There must more than 0 people", preferredStyle: UIAlertControllerStyle.alert)
                
                let cancelAction=UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
                alert.addAction(cancelAction)
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { action in
                    self.people.text = "1"
                    self.updateTipTotals()
                })
                alert.addAction(okAction)
                
                present(alert, animated: true, completion: nil)
            }
        }
        //format currency
        let currencyFormatter = NumberFormatter()
         currencyFormatter.numberStyle=NumberFormatter.Style.currency
        
        //return a formatted string
        tipDue.text=currencyFormatter.string(from: NSNumber(value: tip))
        totalDue.text=currencyFormatter.string(from: NSNumber(value: total))
        totalDuePerPerson.text=currencyFormatter.string(from:NSNumber(value: personTotal))
    }
    
    func textFieldDidEndEditing(_ textfield:UITextField){
        updateTipTotals()
    }
    
    override func viewDidLoad() {
        checkAmount.delegate=self
        tipPercent.delegate=self
        people.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

