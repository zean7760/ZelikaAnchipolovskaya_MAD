//
//  MasterViewController.swift
//  lab4
//
//  Created by CU Boulder on 2/27/18.
//  Copyright © 2018 Zelika Anchipolovskya. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    
    var projects = [Projects]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadjson()
    }

    func loadjson(){
        let urlPath = "http://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline"
        print("URL RESPONSE  \(urlPath)")
        guard let url = URL(string: urlPath)
            else {
                print("url error")
                return
        }
        let session = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            let statusCode = httpResponse.statusCode
            guard statusCode == 200
                else {
                    print("file download error")
                    return
            }
            //download successful
            print("download complete")
            DispatchQueue.main.async {self.parsejson(data!)}
        })
        //must call resume to run session
       //print("reaches here")
        session.resume()
        
    }
    
    func parsejson(_ data: Data){
        do
        {
           
            let api = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
            
            print(api)
            
            //get all results
            guard let array = api as? [Any] else {
               
                return
            }
            
            
            for result in array{
                
                guard let resultDict = result as? [String: Any]
                    else {
                        return}
                
                guard let newname = resultDict["name"] as? String
                    else {
                        continue}
                
                guard let newprice = resultDict["price"] as? String
                    else {
                        continue}
                
                guard let newlink = resultDict["product_link"] as? String else { continue}
                
                print(newname)
                print(newprice)
                print(newlink)
                
                
                let newProject = Projects(name: newname, price: newprice, product_link: newlink)
                //add object to array
                
                //print(newProject)
            
            self.projects.append(newProject)
                //print(newProject)
            }
        }catch{
                 print("Error with JSON: \(error)")
                return
            }
            
        
            //print("reaches here")
        
    
        //reload the table data after the json data has been downloaded
        tableView.reloadData()
    }
    
   

    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
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
                let project = projects[indexPath.row]
                let title = project.name
                let url = project.product_link
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = url
                controller.title = title
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
        return projects.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let project = projects[indexPath.row]
        cell.textLabel!.text = project.name
        cell.detailTextLabel!.text = "$ " + String(project.price)

        return cell
    }
/*
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            objects.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
*/

}

