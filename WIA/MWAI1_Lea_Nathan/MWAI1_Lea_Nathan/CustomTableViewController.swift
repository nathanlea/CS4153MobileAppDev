//
//  CustomTableViewController.swift
//  MWAI1_Lea_Nathan
//
//  Created by Nathan on 10/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    
    Alabama
    Alaska
    Arizona
    Arkansas
    California
    Colorado
    Connecticut
    Delaware
    Florida
    Georgia
    Hawaii
    Idaho
    Illinois Indiana
    Iowa
    Kansas
    Kentucky
    Louisiana
    Maine
    Maryland
    Massachusetts
    Michigan
    Minnesota
    Mississippi
    Missouri
    Montana Nebraska
    Nevada
    New Hampshire
    New Jersey
    New Mexico
    New York
    North Carolina
    North Dakota
    Ohio
    Oklahoma
    Oregon
    Pennsylvania Rhode Island
    South Carolina 
    South Dakota 
    Tennessee 
    Texas 
    Utah 
    Vermont 
    Virginia 
    Washington 
    West Virginia 
    Wisconsin 
    Wyoming
    
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
        return 19
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

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
