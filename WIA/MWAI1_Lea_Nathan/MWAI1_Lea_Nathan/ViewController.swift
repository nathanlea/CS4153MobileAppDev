//
//  ViewController.swift
//  MWAI1_Lea_Nathan
//
//  Created by Nathan on 10/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

/********************************
*
* IMAGE NOTICE:
*    ALL IMAGES ARE TAKEN FROM
*    geology.com
*
********************************/

import UIKit

class ViewController: UIViewController {
    
    var stateName = ""
    var stateImagePath = ""

    @IBOutlet weak var StateImageView: UIImageView!
    internal var imageURLString: String = "http://geology.com/state-map/maps/"
    
    // Create the serial queue for our web access.
    var webQueue = dispatch_queue_create("Web Queue", DISPATCH_QUEUE_SERIAL)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = stateName
        
        //Instead of inflating app size we are going to just load these from the web!
        
        //This method taken from Dr. Mayfield Sept 24 handout
        
        // Create the NSURL object for the image path.
        if let url = NSURL(string: imageURLString+stateImagePath+".gif") {
            dispatch_async(webQueue) { () in
                // This following "if let" is a blocking call!
                if let data = NSData(contentsOfURL: url) {
                    // Now that we have successfully retrieved the image, we need to
                    // create a task on the main queue to populate the image view.
                    dispatch_async(dispatch_get_main_queue()) { () in
                        // Set the content mode of the image view.
                        self.StateImageView.contentMode = UIViewContentMode.ScaleAspectFit
                        // Convert the data to an image and populate the image view.
                        self.StateImageView.image = UIImage(data: data)
                    }
                }
            }
        }

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

