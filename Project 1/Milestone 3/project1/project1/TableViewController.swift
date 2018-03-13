//
//  TableViewController.swift
//  project1
//
//  Created by CU Boulder on 3/3/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import Firebase

class TableViewController: UITableViewController {
    
    
    var ref: DatabaseReference!
    var workouts = [Exercise]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference()
        
        ref.child("Workouts Recorded").observe(DataEventType.value, with: {snapshot in self.workouts=[]
            
            for item in snapshot.children.allObjects as! [DataSnapshot]{
                if let workoutValue = item.value as? [String: String],
                   
                    let json = try? JSONEncoder().encode(workoutValue),
                    let newWorkout = try? JSONDecoder().decode(Exercise.self, from: json)
                
                {
                    self.workouts.append(newWorkout)
                    print("item..:", item)
                    print("adding to array: ", newWorkout)
                }
            }
            self.tableView.reloadData()
        })

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print("workouts counting: ", workouts.count)
        return workouts.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workoutcell", for: indexPath)
        let Workout = workouts[indexPath.row]
        cell.textLabel!.text = Workout.type
        print("Workout: ", Workout)
        cell.detailTextLabel?.text = Workout.time
        
        // Configure the cell...
        
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
            //let workDone = Workouts[indexPath.row]
            
            let workoutref = ref.childByAutoId()
            workoutref.ref.removeValue()
            
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        if segue.identifier == "savesegue"{
            let source = segue.source as! ViewController
            if source.addedNote.isEmpty == false{
                
                let newWorkout = Exercise(newtype: source.addedType ,newnotes: source.addedNote, newsets: source.addedSets, newreps: source.addedReps, newtime: source.addedTime)
                workouts.append(newWorkout)
                let newWorkDict = ["type": source.addedType,"sets": source.addedSets, "reps": source.addedReps, "notes": source.addedNote, "time": source.addedTime]
                
                let workoutref = ref.child("Workouts Recorded").childByAutoId()
                workoutref.setValue(newWorkDict)
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsegue" {
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPath(for: sender as! UITableViewCell)!
            let myWorkout = workouts[indexPath.row]
            
            detailVC.title = myWorkout.time
            detailVC.mySet = myWorkout.sets
            detailVC.myReps = myWorkout.reps
            detailVC.myType = myWorkout.type
            detailVC.myNotes = myWorkout.notes
            
            
            
        }
    }

    // MARK: - Table view data source

 

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
