//
//  CustomTableViewController.swift
//  MWAI1_Lea_Nathan
//
//  Created by Nathan on 10/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    typealias stateTuple = (name: String, nickname: String, imageFileName: String, visited: Bool)
    var stateArray: [[stateTuple]] =
    [[( ( name: "Alabama", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false ) ),
        ( (name: "Alaska", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Arizona", nickname: "WE have grand canyon", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Arkansas", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "California", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Colorado", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Connecticut", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Delaware", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Florida", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Georgia", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Hawaii", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Idaho", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Illinois", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Indiana", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Iowa", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Kansas", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Kentucky", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
    
    [( (name: "Louisiana", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Maine", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Maryland", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Massachusetts", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Michigan", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Minnesota", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Mississippi", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Missouri", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Montana", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Nebraska", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Nevada", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "New Hampshire", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "New Jersey", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "New Mexico", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "New York", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "North Carolina", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "North Dakota", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Ohio", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Oklahoma", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Oregon", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Pennsylvania", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Rhode Island", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "South Carolina", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "South Dakota", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Tennessee", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Texas", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Utah", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Vermont", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Virginia", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )],
        
    [( (name: "Washington", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "West Virginia", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Wisconsin", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) ),
        ( (name: "Wyoming", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )]]
    var currentNumberOfStatesVisited = 0
    var sectionHeaders = ["A", "C", "D", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "V", "W"]
    var data: stateTuple!
    
    @IBOutlet weak var VistedIndicator: UIBarButtonItem!
    
    @IBAction func ResetButton(sender: UIBarButtonItem) {
        currentNumberOfStatesVisited = 0;
        VistedIndicator.title = "Visited: " + String(currentNumberOfStatesVisited)
        
        for var i = 0; i < stateArray.count; i++ {
            for var j = 0; j < stateArray[i].count; j++ {
                stateArray[i][j].visited = false;
            }
        }
        self.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return sectionHeaders.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch( section ) {
        case 0: return 4;
        case 1: return 3;
        case 2: return 1;
        case 3: return 1;
        case 4: return 1;
        case 5: return 1;
        case 6: return 4;
        case 7: return 2;
        case 8: return 1;
        case 9: return 8;
        case 10: return 8;
        case 11: return 3;
        case 12: return 1;
        case 13: return 1;
        case 14: return 2;
        case 15: return 2;
        case 16: return 1;
        case 17: return 2;
        case 18: return 4;
        default: return 0;
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //var cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
        let cell = tableView.dequeueReusableCellWithIdentifier("States", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = stateArray[indexPath.section][indexPath.item].name
        cell.detailTextLabel?.text = stateArray[indexPath.section][indexPath.item].nickname

        if stateArray[indexPath.section][indexPath.item].visited {
            cell.backgroundColor = UIColor(red: 1, green: 212.0/255.0, blue: 229.0/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if stateArray[indexPath.section][indexPath.item].visited {
            currentNumberOfStatesVisited--
            stateArray[indexPath.section][indexPath.item].visited = false;
        } else {
            currentNumberOfStatesVisited++
            stateArray[indexPath.section][indexPath.item].visited = true;
        }
        VistedIndicator.title = "Visited: " + String(currentNumberOfStatesVisited)
        let index = NSIndexPath(forRow: indexPath.row, inSection: indexPath.section)
        self.tableView.reloadRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        self.data = stateArray[indexPath.section][indexPath.item]
        self.performSegueWithIdentifier("ShowState", sender: tableView)
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
        if segue.identifier == "ShowState" {
            let vc: ViewController = segue.destinationViewController as! ViewController
            vc.stateImagePath = self.data.imageFileName
            vc.stateName = self.data.name
        }
    }


}
