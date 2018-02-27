//
//  SecondViewController.swift
//  Lab1
//
//  Created by CU Boulder on 2/2/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBAction func gotopaint(_ sender: UIButton) {
        //checks to see if app is on phone
        if(UIApplication.shared.canOpenURL(URL(string: "PaintTester://")!)){
            UIApplication.shared.open(URL(string: "PaintTester://")!, options: [:], completionHandler: nil)
        }else {
            //opens app in app store
            if (UIApplication.shared.canOpenURL(URL(string: "itms-apps://itunes.apple.com/us/app/paint-tester/id545366469?mt=8")!)){
                UIApplication.shared.open(URL(string:"itms-apps://itunes.apple.com/us/app/paint-tester/id545366469?mt=8")!, options: [:], completionHandler: nil)
            }else{
                //opens in internet if the app store doesn't work for some reason
                UIApplication.shared.open(URL(string:
                    "http://www.itunes.apple.com/us/app/paint-tester/id545366469?mt=8")!, options: [:], completionHandler: nil)
            }
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

