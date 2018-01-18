//
//  ViewController.swift
//  lab1
//
//  Created by Zelika Anchipolovskaya on 9/12/17.
//  Copyright © 2017 Zelika Anchipolovskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var messageText: UILabel!
    @IBOutlet weak var artImage: UIImageView!
    @IBAction func clickIt(_ sender: UIButton) {
        if sender.tag == 1{
            artImage.image=UIImage(named:"springRE")
            messageText.text = "Chautauqua Park"
        }
        else if sender.tag == 2{
            artImage.image=UIImage(named:"fallRE")
            messageText.text = "View from Flagstaff"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

