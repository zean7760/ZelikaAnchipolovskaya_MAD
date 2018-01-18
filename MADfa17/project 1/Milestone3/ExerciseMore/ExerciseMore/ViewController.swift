//
//  ViewController.swift
//  ExerciseMore
//
//  Created by Zelika Anchipolovskaya on 10/11/17.
//  Copyright © 2017 ATLAS. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource{
    
    
    @IBOutlet weak var tableView: UITableView!
    
    //Array of Exercise objects, Exercise is a NSManagedObject that was made by Xcode
    var workouts = [Exercise]()
    
    //Moc is going to be inistiallized w/ moc, We get it from accessing the persistant containers viewcontext property, this is defined in AppDelegate
    var moc:NSManagedObjectContext!
    
    //reference the AppDelegate to save data and to access our moc
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moc = appDelegate?.persistentContainer.viewContext
        self.tableView.dataSource = self
        
        loadView()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    func loadData(){
        
        let exerciseRequest:NSFetchRequest<Exercise> = Exercise.fetchRequest()
        
        let sortDescriptors = NSSortDescriptor(key: "added", ascending: false)
        exerciseRequest.sortDescriptors = [sortDescriptors]
        
        do{
            try workouts = moc.fetch(exerciseRequest)
            print(workouts)
        }catch{
            print("Could not load data")
        }
        
        self.tableView.reloadData()
    }
   
    @IBAction func startReminding(_ sender: Any) {
        appDelegate?.scheduleNotification()
    }

    @IBAction func addExerciseToDatabase(_ sender: UIButton) {
        
        let workout = Exercise(context: moc)
        
        workout.added = NSDate()
        
        if sender.tag == 0{
            workout.exerciseType = "Cardio"
        }else{
            workout.exerciseType = "Strength"
        }
        
        appDelegate?.saveContext()
        
        loadData()
        
       
    }
    

    func numberOfSections(in tableView: UITableView) -> Int{
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return workouts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       print("hi")
        //
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let workout = workouts[indexPath.row]
        print(workout)
        let exerciseType = workout.exerciseType
        cell.textLabel?.text = exerciseType
        
        let workoutDate = workout.added as! Date
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM d yyyy, hh:mm"
        
        cell.detailTextLabel?.text = dateFormatter.string(from: workoutDate)
        
        if exerciseType == "Cardio" {
            
            cell.imageView?.image = UIImage(named: "cardioButton")
            
        }else{
            
            cell.imageView?.image = UIImage(named: "strengthButton")
            
        }
        
        return cell
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

