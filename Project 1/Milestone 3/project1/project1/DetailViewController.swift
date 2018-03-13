//
//  DetailViewController.swift
//  project1
//
//  Created by CU Boulder on 3/12/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var setsLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var mySet = String()
    var myReps = String()
    var myNotes = String()
    var myType = String()
    
    override func viewWillAppear(_ animated: Bool) {
       //mySet = setsLabel.text!
        //print(mySet)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setsLabel.text = mySet
        repsLabel.text = myReps
        notesLabel.text = myNotes
        if myType == "Strength" {
            typeImage.image = UIImage(named: "strengthButton")
        }else if myType == "Cardio" {
            typeImage.image = UIImage(named: "cardioButton")
        }
        
        // Do any additional setup after loading the view.
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
