//
//  TableViewController.swift
//  WIA11_Lea_Nathan
//
//  Created by Nathan on 10/30/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

var elements: [Dictionary<String, String>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Note that, beginning with iOS 9, we must use "HTTPS"
        // rather than "HTTP".
        let postEndpoint =     "https://cs.okstate.edu/~user/trains.php/user/password/dbname/fall15_trains"
                    
            // Set up the URL instance for the service.
            guard let url = NSURL(string: postEndpoint) else {
                print("Error: cannot create URL")
                return
            }
            // Use the URL to set up a URL request.
            let urlRequest = NSMutableURLRequest(URL: url)
            urlRequest.HTTPMethod = "GET"
            // We also need a URL session configuration instance.
            let config = NSURLSessionConfiguration.defaultSessionConfiguration()
            // Now set up the URL session instance needed to make the call.
            let session = NSURLSession(configuration: config)
            
            // The method dataTaskWithRequest specifies a completion
            // closure; it is invoked asynchronously when the call to
            // the service returns.

            let task = session.dataTaskWithRequest(urlRequest)
                { (data, response, error) in
                // Check to see if any data was returned.
                guard let resultData = data else {
                    print("Error: Did not receive data")
                    return
                }
                // Check to see if any error was encountered.
                guard error == nil else {
                    print("Error making call")
                    print(error)
                    return
                }
                // Create a dictionary for the results
            
                let result: NSArray
                do {
                    // Attempt to turn the result into JSON data.
                    result =
                        try NSJSONSerialization.JSONObjectWithData(resultData,
                        options: []) as! NSArray
                } catch {
                        print("Error trying to convert returned data to JSON")
                        return
                }
                self.elements = result as! [Dictionary<String, String>]
                dispatch_sync(dispatch_get_main_queue(), {
                    self.tableView.reloadData()
                })
        }
        // Make the call to the service.
        task.resume()
        
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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.elements.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("trains", forIndexPath: indexPath)
    
        //print(self.elements[i]["number"])
        cell.textLabel?.text=self.elements[indexPath.item]["number"]
        cell.detailTextLabel?.text = self.elements[indexPath.item]["roadName"]! + " - " + self.elements[indexPath.item]["type"]!

        // Configure the cell...

        return cell
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
