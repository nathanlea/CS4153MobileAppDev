//
//  AddChoiceViewController.swift
//  MWAI_Lea_Nathan
//
//  Created by LEA NATHAN H on 11/3/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class AddChoiceViewController: UIViewController {
 
    @IBOutlet weak var nameOfChoiceTextField: UITextField!
    
    
    @IBOutlet weak var saveChoiceButton: UIButton!
    
    @IBAction func saveChoiceButtonAction(sender: AnyObject) {
    }
    
    @IBAction func cancelButtonAction(sender: AnyObject) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Add Choice"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "saveChoiceSegue") {
            (segue.destinationViewController as! ChoicesTableViewController).newChoice = nameOfChoiceTextField.text!
        }
    }


}
