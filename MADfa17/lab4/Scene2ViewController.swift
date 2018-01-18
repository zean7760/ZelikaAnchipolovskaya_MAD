//
//  Scene2ViewController.swift
//  lab4
//
//  Created by Zelika Anchipolovskaya on 10/18/17.
//  Copyright © 2017 ATLAS. All rights reserved.
//

import UIKit

class Scene2ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userAdventure: UITextField!
    @IBOutlet weak var userCountry: UITextField!
    override func viewDidLoad() {
        userCountry.delegate=self
        userAdventure.delegate=self
        super.viewDidLoad()

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneBlog"{
            let scene1ViewController = segue.destination as! ViewController
            if userCountry.text!.isEmpty == false {
                scene1ViewController.user.favCountry=userCountry.text
            }
            if userAdventure.text!.isEmpty == false{
                scene1ViewController.user.favAdventure=userAdventure.text
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
}
