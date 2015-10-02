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
    var stateArray: [[stateTuple]] = [[]]
    var currentNumberOfStatesVisited = 0
    var sectionHeaders = ["A", "C", "D", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "V", "W"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        stateArray[0].append( ( name: "Alabama", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false ) )
        stateArray[0].append( (name: "Alaska", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[0].append( (name: "Arizona", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[0].append( (name: "Arkansas", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[1].append( (name: "California", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[1].append( (name: "Colorado", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[1].append( (name: "Connecticut", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[2].append( (name: "Delaware", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[3].append( (name: "Florida", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[4].append( (name: "Georgia", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[5].append( (name: "Hawaii", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[6].append( (name: "Idaho", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[6].append( (name: "Illinois", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[6].append( (name: "Indiana", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[6].append( (name: "Iowa", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[7].append( (name: "Kansas", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[7].append( (name: "Kentucky", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[8].append( (name: "Louisiana", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Maine", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Maryland", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Massachusetts", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Michigan", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Minnesota", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Mississippi", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Missouri", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[9].append( (name: "Montana", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "Nebraska", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "Nevada", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "New Hampshire", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "New Jersey", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "New Mexico", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "New York", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "North Carolina", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[10].append( (name: "North Dakota", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[11].append( (name: "Ohio", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[11].append( (name: "Oklahoma", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[11].append( (name: "Oregon", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[12].append( (name: "Pennsylvania", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[13].append( (name: "Rhode Island", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[14].append( (name: "South Carolina", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[14].append( (name: "South Dakota", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[15].append( (name: "Tennessee", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[15].append( (name: "Texas", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[16].append( (name: "Utah", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[17].append( (name: "Vermont", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[17].append( (name: "Virginia", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[18].append( (name: "Washington", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[18].append( (name: "West Virginia", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[18].append( (name: "Wisconsin", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
        stateArray[18].append( (name: "Wyoming", nickname: "The Last Frontier", imageFileName: "alaska-map.jpg", visited: false) )
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
        cell.textLabel?.text = stateArray[indexPath.row][indexPath.item].name
        cell.detailTextLabel?.text = stateArray[indexPath.row][indexPath.item].nickname

        if stateArray[indexPath.row][indexPath.item].visited {
            cell.backgroundColor = UIColor.init(red: 255, green: 212, blue: 229, alpha: 1)
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
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
    }
    */

}
