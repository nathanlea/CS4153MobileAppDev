//
//  ViewController.swift
//  Hello World
//
//  Created by Blayne Mayfield on 8/16/15.
//  Copyright © 2015 Oklahoma State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //userNameTextField.text = "Hello " + "world"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sayHelloButtonClicked(sender: UIButton) {
        outputLabel.text = "Hello, " + userNameTextField.text!
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

