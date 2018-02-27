//
//  FirstViewController.swift
//  Lab1
//
//  Created by CU Boulder on 2/2/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    
    @IBOutlet weak var colorWheel: UIPickerView!
    @IBOutlet weak var colorLabel: UILabel!
    let categoriesComponent = 0
    let colorComponent = 1
    
    var colors = [String: [String]]()
    var categories = [String]()
    var colorsNames = [String]()
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == categoriesComponent {
            return categories.count
        }else {
            return colorsNames.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == categoriesComponent{
            return categories[row]
        }else {
            return colorsNames[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == categoriesComponent{
            let selectedCat = categories[row]
            colorsNames = colors[selectedCat]!
            colorWheel.reloadComponent(colorComponent)
            colorWheel.selectRow(0, inComponent: colorComponent, animated: true)
        }
        let categoryrow = pickerView.selectedRow(inComponent: categoriesComponent)
        let colorrow = pickerView.selectedRow(inComponent: colorComponent)
        
        colorLabel.text = "You chose \(categories[categoryrow]) colors: \(colorsNames[colorrow])"
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let pathURL = Bundle.main.url(forResource: "colors",
                                         withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL) //decodes the property list
                colors = try plistdecoder.decode([String:
                    [String]].self, from: data)
                categories = Array(colors.keys)
                colorsNames = colors[categories[0]]! as [String]
            } catch {
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

