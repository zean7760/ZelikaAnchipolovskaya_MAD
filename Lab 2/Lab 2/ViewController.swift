//
//  ViewController.swift
//  Lab 2
//
//  Created by CU Boulder on 2/19/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var workoutsList = Workouts()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // URL for our plist
        if let pathURL = Bundle.main.url(forResource: "workout", withExtension: "plist"){
            //creates a property list decoder object
            let plistdecoder = PropertyListDecoder()
            do {
                let data = try Data(contentsOf: pathURL) //decodes the property list
                workoutsList.workoutData = try plistdecoder.decode([String: [String]].self, from: data)
                workoutsList.workouts = Array(workoutsList.workoutData.keys)
                } catch {
                        // handle error
                        print(error)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "workoutsegue" {
            let detailVC = segue.destination as! detailTableViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            
            //sets the data for the destination controller
            detailVC.title = workoutsList.workouts[indexPath.row]
            detailVC.workoutListDetail = workoutsList
            detailVC.selectedWorkout = indexPath.row
        }
    }
    
    //Number of rows in the section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workoutsList.workouts.count
    }
    
    //Displays table view cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //configure the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = workoutsList.workouts[indexPath.row]
        return cell
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

