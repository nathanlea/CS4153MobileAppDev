//
//  CustomTableViewController.swift
//  MWAI1_Lea_Nathan
//
//  Created by Nathan on 10/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController {
    //Create Custom tuple to store state data
    typealias stateTuple = (name: String, nickname: String, imageFileName: String, visited: Bool)
    
    //State array to stor states
    //These are stored in Sections, [[A],[C]...]
    //The image File name is a reference to the map http://geology.com/state-map/maps/alabama-physiscal-map.gif
    var stateArray: [[stateTuple]] =
    [[( ( name: "Alabama", nickname: "Lizard State", imageFileName: "alabama-physical-map", visited: false ) ),
        ( (name: "Alaska", nickname: "The Last Frontier", imageFileName: "alaska-physical-map", visited: false) ),
        ( (name: "Arizona", nickname: "Grand Canyon State", imageFileName: "arizona-physical-map", visited: false) ),
        ( (name: "Arkansas", nickname: "The Natural State", imageFileName: "arkansas-physical-map", visited: false) )],
        
    [( (name: "California", nickname: "The Golden State", imageFileName: "california-physical-map", visited: false) ),
        ( (name: "Colorado", nickname: "Centennial State", imageFileName: "colorado-physical-map", visited: false) ),
        ( (name: "Connecticut", nickname: "Constitution State", imageFileName: "connecticut-physical-map", visited: false) )],
        
    [( (name: "Delaware", nickname: "The First State", imageFileName: "delaware-physical-map", visited: false) )],
        
    [( (name: "Florida", nickname: "Sunshine State", imageFileName: "florida-physical-map", visited: false) )],
        
    [( (name: "Georgia", nickname: "Peach State", imageFileName: "georgia-physical-map", visited: false) )],
        
    [( (name: "Hawaii", nickname: "Aloha State", imageFileName: "hawaii-physical-map", visited: false) )],
        
    [( (name: "Idaho", nickname: "Gem State", imageFileName: "idaho-physical-map", visited: false) ),
        ( (name: "Illinois", nickname: "Prairie State", imageFileName: "illinois-physical-map", visited: false) ),
        ( (name: "Indiana", nickname: "Hoosier State", imageFileName: "indiana-physical-map", visited: false) ),
        ( (name: "Iowa", nickname: "Hawkeye State", imageFileName: "iowa-physical-map", visited: false) )],
        
    [( (name: "Kansas", nickname: "Sunflower State", imageFileName: "kansas-physical-map", visited: false) ),
        ( (name: "Kentucky", nickname: "Bluegress State", imageFileName: "kentucky-physical-map", visited: false) )],
    
    [( (name: "Louisiana", nickname: "Pelican State", imageFileName: "louisiana-physical-map", visited: false) )],
        
    [( (name: "Maine", nickname: "Pine Tree State", imageFileName: "maine-physical-map", visited: false) ),
        ( (name: "Maryland", nickname: "Old Line State", imageFileName: "maryland-physical-map", visited: false) ),
        ( (name: "Massachusetts", nickname: "The Bay State", imageFileName: "massachusetts-physical-map", visited: false) ),
        ( (name: "Michigan", nickname: "The Great Lakes State", imageFileName: "michigan-physical-map", visited: false) ),
        ( (name: "Minnesota", nickname: "North Star State", imageFileName: "minnesota-physical-map", visited: false) ),
        ( (name: "Mississippi", nickname: "Magnolia State", imageFileName: "mississippi-physical-map", visited: false) ),
        ( (name: "Missouri", nickname: "Show-Me State", imageFileName: "missouri-physical-map", visited: false) ),
        ( (name: "Montana", nickname: "Treasure State", imageFileName: "montana-physical-map", visited: false) )],
        
    [( (name: "Nebraska", nickname: "Cornhusker State", imageFileName: "nebraska-physical-map", visited: false) ),
        ( (name: "Nevada", nickname: "Silver State", imageFileName: "nevada-physical-map", visited: false) ),
        ( (name: "New Hampshire", nickname: "Granite State", imageFileName: "new-hampshire-physical-map", visited: false) ),
        ( (name: "New Jersey", nickname: "Garden State", imageFileName: "new-jersey-physical-map", visited: false) ),
        ( (name: "New Mexico", nickname: "Land of Enchantment", imageFileName: "new-mexico-physical-map", visited: false) ),
        ( (name: "New York", nickname: "Emipire State", imageFileName: "new-york-physical-map", visited: false) ),
        ( (name: "North Carolina", nickname: "Old North State", imageFileName: "north-carolina-physical-map", visited: false) ),
        ( (name: "North Dakota", nickname: "Peace Garden State", imageFileName: "north-dakota-physical-map", visited: false) )],
        
    [( (name: "Ohio", nickname: "Buckeye State", imageFileName: "ohio-physical-map", visited: false) ),
        ( (name: "Oklahoma", nickname: "Sooner State", imageFileName: "oklahoma-physical-map", visited: false) ),
        ( (name: "Oregon", nickname: "Beaver State", imageFileName: "oregon-physical-map", visited: false) )],
        
    [( (name: "Pennsylvania", nickname: "Keystone State", imageFileName: "pennsylvania-physical-map", visited: false) )],
        
    [( (name: "Rhode Island", nickname: "Ocean State", imageFileName: "rhode-island-physical-map", visited: false) )],
        
    [( (name: "South Carolina", nickname: "Palemetto State", imageFileName: "south-carolina-physical-map", visited: false) ),
        ( (name: "South Dakota", nickname: "The Mount Rushmore State", imageFileName: "south-dakota-physical-map", visited: false) )],
        
    [( (name: "Tennessee", nickname: "Volunteer State", imageFileName: "tennessee-physical-map", visited: false) ),
        ( (name: "Texas", nickname: "Lone State State", imageFileName: "texas-physical-map", visited: false) )],
        
    [( (name: "Utah", nickname: "Beehive State", imageFileName: "utah-physical-map", visited: false) )],
        
    [( (name: "Vermont", nickname: "Green Mountatin State", imageFileName: "vermont-physical-map", visited: false) ),
        ( (name: "Virginia", nickname: "The Old Dominion", imageFileName: "virginia-physical-map", visited: false) )],
        
    [( (name: "Washington", nickname: "Evergreen State", imageFileName: "washington-physical-map", visited: false) ),
        ( (name: "West Virginia", nickname: "Mountain Stae", imageFileName: "west-virginia-physical-map", visited: false) ),
        ( (name: "Wisconsin", nickname: "America's Dairyland", imageFileName: "wisconsin-physical-map", visited: false) ),
        ( (name: "Wyoming", nickname: "Equality State", imageFileName: "wyoming-physical-map", visited: false) )]]
    
    //Var to store the number of states
    var currentNumberOfStatesVisited = 0
    //Section header array
    var sectionHeaders = ["A", "C", "D", "F", "G", "H", "I", "K", "L", "M", "N", "O", "P", "R", "S", "T", "U", "V", "W"]
    //Placeholder to store the data to pass when segue'ing to ViewController
    var data: stateTuple!
    
    @IBOutlet weak var VistedIndicator: UIBarButtonItem!
    
    @IBAction func ResetButton(sender: UIBarButtonItem) {
        //If reset button was clicked fire UIAlertController to confirm there choice
        let alert = UIAlertController(title: "Reset All?", message: "Are you sure you want to reset all?", preferredStyle: UIAlertControllerStyle.Alert)
        //If yes, reset the count and update the ui
        alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
            self.currentNumberOfStatesVisited = 0;
            self.VistedIndicator.title = "Visited: " + String(self.currentNumberOfStatesVisited)
            
            for var i = 0; i < self.stateArray.count; i++ {
                for var j = 0; j < self.stateArray[i].count; j++ {
                    self.stateArray[i][j].visited = false;
                }
            }
            //Redraw the table to clear highlighting
            self.tableView.reloadData()

        }))
        alert.addAction(UIAlertAction(title: "No", style: .Default, handler: { action in
        }))
        self.presentViewController(alert, animated: true, completion: nil)
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
        return stateArray[section].count;
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //Update or init the cells that have the "States" identifier
        let cell = tableView.dequeueReusableCellWithIdentifier("States", forIndexPath: indexPath)
        
        // Configure the cell...
        cell.textLabel?.text = stateArray[indexPath.section][indexPath.item].name
        cell.detailTextLabel?.text = stateArray[indexPath.section][indexPath.item].nickname
        
        //If visited, change background color
        if stateArray[indexPath.section][indexPath.item].visited {
            cell.backgroundColor = UIColor(red: 1, green: 212.0/255.0, blue: 229.0/255.0, alpha: 1.0)
        } else {
            cell.backgroundColor = UIColor.whiteColor()
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //If row was selected
        
        //If visted is true, this is the reset case
        if stateArray[indexPath.section][indexPath.item].visited {
            //Confirm UIAlertController
            let alert = UIAlertController(title: "Reset State?", message: "Are you sure you want to reset visiting " + self.stateArray[indexPath.section][indexPath.item].name + "?", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .Default, handler: { action in
                self.currentNumberOfStatesVisited--
                self.stateArray[indexPath.section][indexPath.item].visited = false;
                self.VistedIndicator.title = "Visited: " + String(self.currentNumberOfStatesVisited)
                
                //Update single row
                let index = NSIndexPath(forRow: indexPath.row, inSection: indexPath.section)
                self.tableView.reloadRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Fade)
            }))
            alert.addAction(UIAlertAction(title: "No", style: .Default, handler: { action in
            }))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            //If visited
            
            currentNumberOfStatesVisited++
            stateArray[indexPath.section][indexPath.item].visited = true;
            VistedIndicator.title = "Visited: " + String(currentNumberOfStatesVisited)

            //Update single row
            let index = NSIndexPath(forRow: indexPath.row, inSection: indexPath.section)
            self.tableView.reloadRowsAtIndexPaths([index], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaders[section]
    }
    
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        self.data = stateArray[indexPath.section][indexPath.item]
        self.performSegueWithIdentifier("ShowState", sender: tableView)
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ShowState" {
            //Get view we are going to
            let vc: ViewController = segue.destinationViewController as! ViewController
            //Package data and send to new view
            vc.stateImagePath = self.data.imageFileName
            vc.stateName = self.data.name
        }
    }


}
