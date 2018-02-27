##My app will allow users to log their workouts

I want to another iteration of the Exercise More App I worked on last semester. This time will implement some of the suggestions that I received when I presented. My classmates said they want to see a journal aspect added, and all of this will be in a multi view app instead of the single view.

1. I will not be using core data this time, but the app will be persistent
	from the notes I will implement this code:
``` Swift
//Data Persistence (countries data)

//We can handle all the data persistence in ViewController.swift
//Add a constant for the filename we’ll write to.

let kfilename = "data1.plist"

Update viewDidLoad()

 //application instance
 let app = UIApplication.shared

 //subscribe to the UIApplicationWillResignActiveNotification notification

 NotificationCenter.default.addObserver(self, selector:#selector(ViewController.applicationWillResignActive(_:)), name:
NSNotification.Name.UIApplicationWillResignActive, object: app)

//Add the method called when the notification is received. @objc is needed in Swift 4 to 
//specifically expose the method to Objective-C
 
//called when the UIApplicationWillResignActiveNotification notification is posted
 
//all notification methods take a single NSNotification instance as their argument
 
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
	
3. The multi-view
	a. this will be a table view (like lab 2)
	b. the saved notes can be looked at with taping the on the note in table view
	c. adding a new note
		1. I wanted to created an overlay menu like the app myfitness pal has
		2. UIActionSheet will should be the tool to use here
			-> the only issue with this is that it implements an alert that pops up from the bottom and the buttons 
			   are not styled. Maybe I can style them with more code, the tutorials I've seen might be
			   just basic examples.
	

prototype:
https://invis.io/6MDT4SVUT#/256792904_Artboard_1
