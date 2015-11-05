//
//  ViewController.swift
//  MWAI_Lea_Nathan
//
//  Created by Nathan on 11/1/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class AddChoice: UIViewController {
    
    
    
    @IBOutlet weak var choiceAddTextField: UITextField!
    
    
    @IBAction func choices(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Choice"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      /*  if(segue.identifier == "addChoice") {
            (segue.destinationViewController as! ChoicesTableViewController).newChoice = nameOfTheNewChoice.text!
        }*/
    }

}

