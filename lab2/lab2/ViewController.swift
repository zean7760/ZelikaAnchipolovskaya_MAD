//
//  ViewController.swift
//  lab2
//
//  Created by CU Boulder on 9/20/17.
//  Copyright © 2017 ATLAS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var carImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBOutlet weak var capitalSwitch: UISwitch!
    @IBOutlet weak var fontSizeLabel: UILabel!
    func updateImage(){
        if imageControl.selectedSegmentIndex==0{
            titleLabel.text="Subaru Forester (2010- 2012)"
            carImage.image=UIImage(named: "forester")
             titleLabel.textColor = UIColor.red
        }else if imageControl.selectedSegmentIndex==1{
            titleLabel.text="Subaru Impreza (2012 - 2016)"
            carImage.image=UIImage(named: "impreza")
             titleLabel.textColor = UIColor.blue
        }else if imageControl.selectedSegmentIndex==2{
            titleLabel.text="Mazda CX-7 (2016 - Present)"
            carImage.image=UIImage(named: "mazda")
             titleLabel.textColor = UIColor.darkGray
        }
    }
    func updateText(){
        if capitalSwitch.isOn{
            titleLabel.text=titleLabel.text?.uppercased()
        }else{
            titleLabel.text=titleLabel.text?.lowercased()
        }
    }
    @IBAction func changeFontSize(_ sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFont(ofSize: fontSizeCGFloat)
        
    }
    @IBAction func updateFont(_ sender: UISwitch) {
        updateText()
    }
    @IBAction func changeInfo(_ sender: UISegmentedControl) {
        updateImage()
        updateText()
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

