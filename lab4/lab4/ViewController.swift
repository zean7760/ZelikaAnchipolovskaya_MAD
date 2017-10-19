//
//  ViewController.swift
//  lab4
//
//  Created by CU Boulder on 10/17/17.
//  Copyright © 2017 ATLAS. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var adventureLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    var user = Blog()
    
    override func viewDidLoad() {
        let filePath = docFilePath(filename)
        
        if FileManager.default.fileExists(atPath: filePath!){
            let path = filePath
            let dataDictionary = NSDictionary(contentsOfFile: path!) as!
            [String:String]
            
            if dataDictionary.keys.contains("country") {
                user.favCountry = dataDictionary["country"]
                countryLabel.text=user.favCountry
            }
            if dataDictionary.keys.contains("adventure") {
                user.favAdventure = dataDictionary["adventure"]
                adventureLabel.text=user.favAdventure
            }
        }
         NotificationCenter.default.addObserver(self, selector: #selector(UIApplicationDelegate.applicationWillResignActive(_:)), name: NSNotification.Name(rawValue: "UIApplicationWillResignActiveNotification"), object: app)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    let app = UIApplication.shared
    
   
    
    func applicationWillResignActive(_ notification: Notification){
        let filePath = docFilePath(filename)
        let data = NSMutableDictionary()
        //adds
        if user.favCountry != nil{
            data.setValue(user.favCountry, forKey: "country")
            
        }
        if user.favAdventure != nil{
            data.setValue(user.favAdventure, forKey: "adventure")
        }
        //write the contents of the array to our plist file
        data.write(toFile: filePath!, atomically: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindSegue(_segue:UIStoryboardSegue){
        countryLabel.text=user.favCountry
        adventureLabel.text=user.favAdventure
    }
    
    let filename = "favs.plist"
    func docFilePath(_ filename: String) ->String?{
        let path = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        let dir = path[0] as NSString
        return dir.appendingPathComponent(filename)
    }


}

