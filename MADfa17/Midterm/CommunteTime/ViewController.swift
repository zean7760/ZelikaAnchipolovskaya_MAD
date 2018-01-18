//
//  ViewController.swift
//  CommunteTime
//
//  Created by CU Boulder on 10/19/17.
//  Copyright © 2017 ATLAS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{

    
    @IBOutlet weak var gasNeeded: UILabel!
    @IBOutlet weak var commuteTime: UILabel!
    @IBOutlet weak var commuteMiles: UITextField!
    override func viewDidLoad() {
        commuteMiles.delegate=self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func textFieldShouldReturn(_ textField:UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
//    @IBAction func gasInTank(_ sender: UISlider) {
//        let fontSize=sender.value
//        gasLabel.text=String(format: "%.0f", fontSize)
//        let fontSizeCGFloat=CGFloat(fontSize)
//        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
//    }
    @IBAction func button(_ sender: UIButton) {
        if sender.tag == 0{
    
            var miles: Float //commute miles
            let mpgCar: Float = 24.00
        
            if commuteMiles.text!.isEmpty{
                miles = 0.0
            }else{
                miles = Float(commuteMiles.text!)!
            }
        
            let time = miles * 3
        
            let gas = mpgCar / miles
        
            let format = NumberFormatter()
            format.numberStyle=NumberFormatter.Style.decimal
        
            commuteTime.text=format.string(from:NSNumber(value: time))
            gasNeeded.text=format.string(from:NSNumber(value:gas))
        }
    }
    
    
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        updateCommute()
//    }

   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

