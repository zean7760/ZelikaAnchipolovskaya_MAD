My app will allow users to log their workouts

I want to another iteration of the Exercise More App I worked on last semester. This time will implement some of the suggestions that I received when I presented. My classmates said they want to see a journal aspect added, and all of this will be in a multi view app instead of the single view.

1. ~~core data must be selected initially~~ I will not be using core data this time, but the app will be persistent
	from the notes I will implement this code:
```
Data Persistence (countries data)

We can handle all the data persistence in ViewController.swift
Add a constant for the filename we’ll write to.

let kfilename = "data1.plist"

Update viewDidLoad()

 //application instance
 let app = UIApplication.shared

 //subscribe to the UIApplicationWillResignActiveNotification
notification

 NotificationCenter.default.addObserver(self, selector:
#selector(ViewController.applicationWillResignActive(_:)), name:
NSNotification.Name.UIApplicationWillResignActive, object: app)

Add the method called when the notification is received. @objc is needed in Swift 4 to 
specifically expose the method to Objective-C
 
//called when the UIApplicationWillResignActiveNotification notification
is posted
 
//all notification methods take a single NSNotification instance as
their argument
 
@objc func applicationWillResignActive(_ notification: NSNotification){
 //get path for data file
 let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
 
let docDir = dirPath[0] //documents directory
 print(docDir)

 // URL for our plist

 let dataFileURL = docDir.appendingPathComponent(kfilename)

 print(dataFileURL)

 //creates a property list decoder object

 let plistencoder = PropertyListEncoder()
 plistencoder.outputFormat = .xml
 
do {
 let data = try plistencoder.encode(continentList.continentData)
 try data.write(to: dataFileURL)
 } catch {
 // handle error
 print(error)
 }
}
```

2. in view controller:
	a.  create a plist that stores the type of exercise
	b. create variable that will access the data from delegate
	c. reference the appDelegate  to save and access the variable from above
	d. initialize viewDidLoad function
	
3. saving from the two buttons
	a. create constant
	b. 
	if tag==0 
		add cardio

	if tag == 1
		add strength
	c. save new information with app delegate function 
	d. call load function

5. load function
	a. create fetch request
	b. configure fetch to sending an array
	c. call fetch function
	d. display by reloading self (table)

6. displaying the table
	a. adopt the UITableViewDataSource protocol
	b. add self as data source
	c. add table view function
	d. add number of section in table function
	e. create cell view in the path

If I figure out how to do all of this I want to put in a notification feature. 


