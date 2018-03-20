//
//  ViewController.swift
//  Lab5
//
//  Created by CU Boulder on 3/20/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var note3: UILabel!
    @IBOutlet weak var note2: UILabel!
    @IBOutlet weak var note1: UILabel!
    
    var mynote1 = String()
    var mynote2 = String()
    var mynote3 = String()
    
    override func viewWillAppear(_ animated: Bool) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        note1.text = mynote1
        note2.text = mynote2
        note3.text = mynote3

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
