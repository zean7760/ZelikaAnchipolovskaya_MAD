//
//  TableViewController.swift
//  Lab5
//
//  Created by CU Boulder on 3/19/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit
import Firebase


class TableViewController: UITableViewController {
    
    
    var notes = [Things]()
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        
        ref.child("notes recorded").observe(DataEventType.value, with: {snapshot in self.notes=[]
            
            for item in snapshot.children.allObjects as! [DataSnapshot]{
                if let noteValue = item.value as? [String: String],
                    
                    let json = try? JSONEncoder().encode(noteValue),
                    let newNote = try? JSONDecoder().decode(Things.self, from: json)
                    
                {
                    self.notes.append(newNote)
                    print("item..:", item)
                    print("adding to array: ", newNote)
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

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return notes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let Note = notes[indexPath.row]
        cell.textLabel!.text = Note.time
        
       
        return cell
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        if segue.identifier == "savesegue" {
            let source = segue.source as! AddViewController
            
            if source.addednote1.isEmpty == false {
                let newDay = Things(newnote1: source.addednote1, newnote2: source.addednote2, newnote3: source.addednote3,newtime: source.addedTime)
                notes.append(newDay)
                let newNotesDict = ["note1": source.addednote1, "note2": source.addednote2, "note3": source.addednote3, "time": source.addedTime]
                let goodThingsRef = ref.child("notes recorded").childByAutoId()
                goodThingsRef.setValue(newNotesDict)
                
                
            }
        }
    }

  
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }


  
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let day = notes[indexPath.row]
            let noteref = ref.child(day.thing1)
            noteref.ref.removeValue()
            tableView.deleteRows(at: [indexPath], with: .fade)
         
        }
    }

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
