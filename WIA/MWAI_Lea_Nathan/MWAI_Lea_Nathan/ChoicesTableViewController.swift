//
//  ChoicesTableViewController.swift
//  MWAI_Lea_Nathan
//
//  Created by Nathan on 11/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit
import CoreData

class ChoicesTableViewController: UITableViewController {

    @IBOutlet var UItableView: UITableView!
    
    var choices = [NSManagedObject]()
    
    var initialData = [
        "Apples",
        "Bread",
        "Butter",
        "Cheese",
        "Eggs",
        "Grapes",
        "Ice Cream",
        "Milk",
        "Oranges",
        "Oreos"
    ]
    
    var tableData : [[NSManagedObject]] = [[]]
    
    var tableSectionHeaders : [String] = []
    
    var selectedItem : String = ""
    
    var newChoice : String = "" {
        didSet {
            if(newChoice == "") { return }
            // Get the app delegate.
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            // Get the managed object context from the app delegate.
            let context = appDelegate.managedObjectContext
            
            // Define the type of entity we are adding.
            let entity = NSEntityDescription.entityForName("Choices",
                inManagedObjectContext: context)
            
            let course = NSManagedObject(entity: entity!,
                insertIntoManagedObjectContext: context)
            
            // Populate the new managed object with course data.
            course.setValue(newChoice, forKey: "name")
        
            // Save the managed object context contents to the database.
            do {
                try context.save()
            }
                catch let error as NSError {
                    print("Cannot save - \(error), \(error.userInfo)")
            }
            tableSectionHeaders.removeAll()
            tableSectionHeaders = []
            tableData.removeAll()
            tableView.reloadData()
            tableData = [[]]
            viewWillAppear(true)
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Choices"
        
        let addButton : UIBarButtonItem = UIBarButtonItem( barButtonSystemItem : .Add, target: self, action: "addToShoppingList" )
        self.navigationItem.rightBarButtonItem = addButton

        // Get the app delegate.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the managed object context from the app delegate.
        let context = appDelegate.managedObjectContext
        
        // Define the type of entity we are adding.
        let entity = NSEntityDescription.entityForName("Choices",
            inManagedObjectContext: context)
        
        // Create a Boolean variable
        var emptyDB = false
        // Create a fetch request.
        let fetchRequest = NSFetchRequest(entityName: "Choices")
        
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
            let course = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext: context)
            
            // Populate the new managed object with course data.
            course.setValue(data, forKey: "name")
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
    
    func addToShoppingList() {
        performSegueWithIdentifier("addChoiceSegue", sender: self)
    }
    
    override func viewWillAppear(animated: Bool) {
        // Get the app delegate.
       let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the managed object context from the app delegate.
        let context = appDelegate.managedObjectContext
        
        // Create a fetch request.
        let fetchRequest = NSFetchRequest(entityName: "Choices")
        
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let sortDescriptors = [sortDescriptor]
        fetchRequest.sortDescriptors = sortDescriptors
        
        // Fetch the records.
        do {
            let records = try context.executeFetchRequest(fetchRequest)
            choices = records as! [NSManagedObject]
            var j = 0;
            var currentLetter = "" //Start this at null to make sure we don't add A if it isn't valid
            //Organize the records
            for(var i = 0; i < choices.count; i++) {
                var nameString = choices[i].valueForKey("name") as! String
                let firstLetter = String(nameString.removeAtIndex(nameString.startIndex))
                if( i == 0 || currentLetter == firstLetter ) {
                    tableData[j].append(choices[i])
                    currentLetter = firstLetter
                    if(i==0) {
                        tableSectionHeaders.append(firstLetter)
                    }
                } else {
                    j++;
                    currentLetter = firstLetter;
                    tableSectionHeaders.append(firstLetter)
                    tableData.append([])
                    tableData[j].append(choices[i])
                }
            }
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
        return tableData.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tableData[section].count
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableSectionHeaders[section]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("choices", forIndexPath: indexPath)

        //cell.textLabel!.text = (courses[indexPath.row].valueForKey("deptAbbr") as! String) + String(courses[indexPath.row].valueForKey("courseNum")!)
        cell.textLabel!.text = tableData[indexPath.section][indexPath.row].valueForKey("name") as? String //choices[indexPath.item].valueForKey("name") as! String

        return cell
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        selectedItem = tableData[indexPath.section][indexPath.row].valueForKey("name") as! String
        return indexPath
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "unwind" {
            (segue.destinationViewController as! ShoppingLostTableViewController).addedItem = selectedItem
        }
    }
    
    @IBAction func addChoiceUnwind(sender:UIStoryboardSegue) {
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {*/
    
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
