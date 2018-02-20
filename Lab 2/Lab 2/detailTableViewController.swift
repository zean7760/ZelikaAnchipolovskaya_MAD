//
//  detailTableViewController.swift
//  Lab 2
//
//  Created by CU Boulder on 2/19/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class detailTableViewController: UITableViewController {
    
    @IBAction func unwindSegue (_ segue:UIStoryboardSegue){
        if segue.identifier=="doneSegue"{
            let source = segue.source as! AddWorkoutViewController
            
            //only add a country if there is text in the textfield
            if ((source.addedWorkout.isEmpty) == false){ //add country to the array
                workouts.append(source.addedWorkout)
                tableView.reloadData()
                let chosenWorkout = workoutListDetail.workouts[selectedWorkout]
                //add country to our data model instance
                workoutListDetail.workoutData[chosenWorkout]?.append(source.addedWorkout)
            }
        }
    }
    var workouts = [String]()
    var selectedWorkout = 0
    
    var workoutListDetail = Workouts()

   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the //navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        workoutListDetail.workouts = Array(workoutListDetail.workoutData.keys)
        let chosenWorkout = workoutListDetail.workouts[selectedWorkout]
        workouts = workoutListDetail.workoutData[chosenWorkout]! as [String]
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return workouts.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)

        cell.textLabel?.text = workouts[indexPath.row]

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete the workout from array
            workouts.remove(at: indexPath.row)
            let chosenWorkout = workoutListDetail.workouts[selectedWorkout]
            workoutListDetail.workoutData[chosenWorkout]?.remove(at: indexPath.row)
            
            //delete the row from the table
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
  

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to toIndexPath: IndexPath) {
        let fromRow = fromIndexPath.row //row being moved from
        let toRow = toIndexPath.row //row being moved to
        let moveWorkout = workouts[fromRow] //workout being moved
        
        //move in array
        workouts.remove(at: fromRow)
        workouts.insert(moveWorkout, at: toRow)
        
        //move in data model instance
        let chosenWorkout = workoutListDetail.workouts[selectedWorkout]
        workoutListDetail.workoutData[chosenWorkout]?.remove(at:fromRow)
        workoutListDetail.workoutData[chosenWorkout]?.insert(moveWorkout, at: toRow)

    }
   

    
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
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
