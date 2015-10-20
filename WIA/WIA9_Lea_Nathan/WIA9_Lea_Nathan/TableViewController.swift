//
//  TableViewController.swift
//  WIA9_Lea_Nathan
//
//  Created by Nathan on 10/19/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {
    
    var initialData = [
        (dept: "MATH", num: 1513, title: "College Algebra"),
        (dept: "CS", num: 1113, title: "CS 1"),
        (dept: "CS", num: 2113, title: "CS 2"),
        (dept: "CS", num: 4153, title: "Mobile App Dev"),
        (dept: "ECEN", num: 2011, title: "Experimental Methods"),
        (dept: "ECEN", num: 3233, title: "Digital Logic Design"),
        (dept: "ECEN", num: 3314, title: "Signal Analysis"),
        (dept: "ECEN", num: 3613, title: "Electromagnetic Fields"),
        (dept: "ECEN", num: 3714, title: "Network Analysis"),
        (dept: "ECEN", num: 3913, title: "Solid State")
    ]
    
    var initialStudentData = [
        (name: "Oliver",    cwid: 23610841),
        (name: "Jack",      cwid: 36053418),
        (name: "Charlie",   cwid: 63072012),
        (name: "Harry",     cwid: 73780429),
        (name: "Jacob",     cwid: 98977176),
        (name: "George",    cwid: 80008637),
        (name: "Alfie",     cwid: 13278564),
        (name: "Noah",      cwid: 59339852),
        (name: "James",     cwid: 33717296),
        (name: "Oscar",     cwid: 95282462),
        (name: "Amelia",    cwid: 77100646),
        (name: "Olivia",    cwid: 24236288),
        (name: "Emily",     cwid: 11385480),
        (name: "Ava",       cwid: 30675541),
        (name: "Isla",      cwid: 44218348),
        (name: "Jessica",   cwid: 98808682),
        (name: "Poppy",     cwid: 27725425),
        (name: "Mia",       cwid: 47618615),
        (name: "Lily",      cwid: 86008107),
        (name: "Isabella",  cwid: 30186414)
    ]
    
    var studentsInClass:[(name: String, cwid: Int)] = []
    
    // Our array of managed objects.
    var courses = [NSManagedObject]()
    var students = [NSManagedObject]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Get the app delegate.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the managed object context from the app delegate.
        let context = appDelegate.managedObjectContext
        
        // Define the type of entity we are adding.
        let entityCourse = NSEntityDescription.entityForName("Course",
            inManagedObjectContext: context)
        let entityStudent = NSEntityDescription.entityForName("Student",
            inManagedObjectContext: context)

        
        // Create a Boolean variable
        var emptyDB = false
        // Create a fetch request.
        let fetchRequest = NSFetchRequest(entityName: "Course")
        
        // Fetch the records.
        do {
            let records = try context.executeFetchRequest(fetchRequest) as! [NSManagedObject]
            if records.count == 0 { emptyDB = true }
        }
        catch let error as NSError
        {
            print("Cannot fetch - \(error), \(error.userInfo)")
        }
        
        // Only write the initial records to the database if the database is empty.
        if emptyDB {
            for data in initialData {
                // Create a managed object (i.e., a database record) and
                // insert it into the managed object context.
                let course = NSManagedObject(entity: entityCourse!,
                    insertIntoManagedObjectContext: context)
                
                
                // Populate the new managed object with course data.
                course.setValue(data.dept, forKey: "deptAbbr")
                course.setValue(data.num, forKey: "courseNum")
                course.setValue(data.title, forKey: "title")

                
                
                let items = course.mutableSetValueForKey("enrollees")
                
                for _ in 0...2 {
                    let randStud = Int(arc4random_uniform(20))
                    let stud = NSManagedObject(entity: entityStudent!,
                        insertIntoManagedObjectContext: context)
                    // Populate the new managed object with course data.
                    stud.setValue(initialStudentData[randStud].name, forKey: "name")
                    stud.setValue(initialStudentData[randStud].cwid, forKey: "cwid")
                    items.addObject(stud)
                    
                }
                
            }
            
            // Save the managed object context contents to the database.
            do {
                try context.save()
            }
            catch let error as NSError {
                print("Cannot save - \(error), \(error.userInfo)")
            }
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        // Get the app delegate.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the managed object context from the app delegate.
        let context = appDelegate.managedObjectContext
        
        // Create a fetch request.
        let fetchRequest = NSFetchRequest(entityName: "Course")
        
        // Fetch the records.
        do {
            let records = try context.executeFetchRequest(fetchRequest)
            courses = records as! [NSManagedObject]
        }
        catch let error as NSError
        {
            print("Cannot fetch - \(error), \(error.userInfo)")
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return courses.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell1", forIndexPath: indexPath)
        
        cell.textLabel!.text = (courses[indexPath.row].valueForKey("deptAbbr") as! String) + String(courses[indexPath.row].valueForKey("courseNum")!)
        
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let studarr = courses[indexPath.row].valueForKey("enrollees") as! NSMutableSet
        
        var studentsToBeSent:[(name: String, cwid: Int)] = []
        
        for students in studarr {
            studentsToBeSent.append( name: students.valueForKey("name") as! String, cwid: students.valueForKey("cwid") as! Int)
        }
        studentsInClass = studentsToBeSent
        self.performSegueWithIdentifier("ShowClassList", sender: tableView)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowClassList" {
            
            let vc: TableViewControllerClassList = segue.destinationViewController as! TableViewControllerClassList
            if(studentsInClass.count==3) {
            //vc.student1 = self.studentsInClass[0]
            //vc.student2 = self.studentsInClass[1]
            //vc.student3 = self.studentsInClass[2]
            vc.students = self.studentsInClass
            }
        }
    }
}
