//
//  ShoppingLostTableViewController.swift
//  MWAI_Lea_Nathan
//
//  Created by Nathan on 11/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit
//import CoreData

class ShoppingLostTableViewController: UITableViewController {
    
    var list:[(name: String, checked: Bool, quantity: Int)] = []
    
    //var items = [NSManagedObject]()
    
    var addedItem : String = "" {
        didSet {
            for(var i = 0; i < list.count; i++) {
                if(list[i].name == addedItem) {
                    list[i].quantity++
                    self.tableView.reloadData()
                    return;
                }
            }
            list.append((addedItem, false, 1))
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Shopping List"
        
        let addButton : UIBarButtonItem = UIBarButtonItem( barButtonSystemItem : .Add, target: self, action: "addToShoppingList" )
        self.navigationItem.rightBarButtonItem = addButton
        
        //list.append(("Title", false, 1))
        /*
        // Get the app delegate.
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the managed object context from the app delegate.
        let context = appDelegate.managedObjectContext
        
        // Define the type of entity we are adding.
        let entity = NSEntityDescription.entityForName("ShoppingList",
            inManagedObjectContext: context)
        
        // Create a Boolean variable
        var emptyDB = false
        // Create a fetch request.
        let fetchRequest = NSFetchRequest(entityName: "ShoppingList")
        
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
            /* for data in initialData {
                // Create a managed object (i.e., a database record) and
                // insert it into the managed object context.
                let course = NSManagedObject(entity: entity!,
                    insertIntoManagedObjectContext: context)
                
                // Populate the new managed object with course data.
                course.setValue(data.dept, forKey: "deptAbbr")
                course.setValue(data.num, forKey: "courseNum")
                course.setValue(data.title, forKey: "title")
            }*/
            
            // Save the managed object context contents to the database.
            do {
                try context.save()
            }
            catch let error as NSError {
                print("Cannot save - \(error), \(error.userInfo)")
            }
        } */

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
    // Get the app delegate.
    /*    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        // Get the managed object context from the app delegate.
        let context = appDelegate.managedObjectContext
        
        // Create a fetch request.
        let fetchRequest = NSFetchRequest(entityName: "ShoppingList")
        
        // Fetch the records.
        do {
            let records = try context.executeFetchRequest(fetchRequest)
            items = records as! [NSManagedObject]
        }
        catch let error as NSError
        {
            print("Cannot fetch - \(error), \(error.userInfo)")
        }*/
    }
    
    
    func addToShoppingList ( ) {
        self.performSegueWithIdentifier("choicesSegue", sender: self)
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
        return list.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ShoppingListItem", forIndexPath: indexPath)
        
        if(list[indexPath.item].checked) {
            cell.imageView?.image = UIImage(imageLiteral: "Box-CheckMark")
        } else {
            cell.imageView?.image = UIImage(imageLiteral: "Box-NoCheckMark")
        }
        
        cell.textLabel?.text = list[indexPath.item].name
        cell.detailTextLabel?.text = String(list[indexPath.item].quantity)
        
        //cell.textLabel!.text = (courses[indexPath.row].valueForKey("deptAbbr") as! String) + String(courses[indexPath.row].valueForKey("courseNum")!)

        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: "", message: "Delete how many?", preferredStyle: UIAlertControllerStyle.Alert)
        if(list[indexPath.item].quantity>1) {
        alert.addAction(UIAlertAction(title: "1", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                //tableView.beginUpdates()
                self.list[indexPath.item].quantity-=1
                //tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                //tableView.endUpdates()
                tableView.reloadData()
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        }
        alert.addAction(UIAlertAction(title: "All", style: .Default, handler: { action in
            switch action.style{
            case .Default:
                if(editingStyle == UITableViewCellEditingStyle.Delete) {
                    self.list.removeAtIndex(indexPath.row)
                    tableView.beginUpdates()
                    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
                    tableView.endUpdates()
                }            case .Cancel:
                print("cancel - No")
            case .Destructive:
                print("destructive - No")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if(!list[indexPath.item].checked) {
            list[indexPath.item].checked = true
        } else {
            list[indexPath.item].checked = false
        }
        self.tableView.reloadData()
    }
    
    @IBAction func doUnwind(sender:UIStoryboardSegue) {
    }
    
    
    override func canPerformUnwindSegueAction(action: Selector, fromViewController: UIViewController, withSender sender: AnyObject) -> Bool {
        return true;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
        if segue.identifier == "unwind" {
            print("\(self) \(__FUNCTION__)")
            unwindForSegue(segue, towardsViewController: self)
            addedItem = (segue.sourceViewController as! ChoicesTableViewController).selectedItem
            
        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }*/
}
