//
//  ViewController.swift
//  BeatlesEXlab2
//
//  Created by Zelika Anchipolovskaya on 9/14/17.
//  Copyright © 2017 Zelika Anchipolovskaya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var beatleImage: UIImageView!
    func updateImage(){
        if imageControl.selectedSegmentIndex == 0{
            titleLabel.text="Young Beatles"
            titleLabel.textColor = UIColor.red
            beatleImage.image=UIImage(named: "beatles1")
        }else if imageControl.selectedSegmentIndex==1{
            titleLabel.text="Not so young Beatles"
            beatleImage.image=UIImage(named: "beatles2")
            titleLabel.textColor = UIColor.cyan
        }
    }
    func updateCaps(){
        if capitalSwitch.isOn{
            titleLabel.text=titleLabel.text?.uppercased()
        }else{
            titleLabel.text=titleLabel.text?.lowercased()
        }
    }
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateCaps()
    }
    @IBAction func updateFont(_ sender: UISwitch) {
       updateCaps()
    }
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
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

