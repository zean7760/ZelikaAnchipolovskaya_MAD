//
//  MasterViewController.swift
//  lab3_b
//
//  Created by CU Boulder on 2/24/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
   
    var characters = [[String: String]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //navigationItem.leftBarButtonItem = editButtonItem
        
        //url for the plist
        if let pathURL = Bundle.main.url(forResource: "harrypotter2", withExtension: "plist"){
            //property list decoder
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL)
                //decodes the plist
                characters = try plistdecoder.decode([[String:String]].self, from: data)
            }catch {
                // handle error
                print(error)
            }
            
        }

        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let character = characters[indexPath.row]
                let url = character["url"]!
                let name = character["name"]!
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = url as AnyObject?
                controller.title = name
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let character = characters[indexPath.row]
        cell.textLabel!.text = character["name"]
        return cell
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return false
    }



}

