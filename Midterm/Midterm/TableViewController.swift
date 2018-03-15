//
//  TableViewController.swift
//  Midterm
//
//  Created by CU Boulder on 3/15/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var places = [Places]()
    
    var detailViewController: WebViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        loadjson()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func loadjson(){
        let urlPath = "https://creative.colorado.edu/~apierce/samples/data/restaurants.json"
        
        guard let url = URL(string: urlPath)
            else{
                print("url error")
                return
        }
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else{
                    print("file download error")
                    return
            }
            print("download complete")
            DispatchQueue.main.async {
                self.parsejson(data!)
            }
        })
        session.resume()
    }
    
    func parsejson(_ data: Data){
        do{
            let api = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            //print(api)
            guard let array = api as? [Any] else {
                return
            }
            
            for result in array{
                guard let resultsDict = result as? [String: Any]
                    else {
                        return
                }
                guard let newname = resultsDict["name"] as? String
                    else {
                        continue}
                
                guard let newurl = resultsDict["url"] as? String
                    else {
                        continue}
                let newPlace = Places(name: newname, url: newurl)
                
                self.places.append(newPlace)
            }
        }catch{
            print("error with JSON: \(error)")
            return
        }
        tableView.reloadData()
    }
    
  
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showdetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let restuarants = places[indexPath.row]
                let title = restuarants.name
                let url = restuarants.url
                
                let controller = (segue.destination as! UINavigationController).topViewController as! WebViewController
                controller.detailItem = url
                controller.title = title
                //controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem
                //controller.navigationItem.leftItemsSupplementBackButton = true

            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let place = places[indexPath.row]
        cell.textLabel?.text = place.name

       
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
