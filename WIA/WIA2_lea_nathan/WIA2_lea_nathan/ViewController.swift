//
//  ViewController.swift
//  WIA2_lea_nathan
//
//  Created by Nathan on 8/31/15.
//  Copyright © 2015 Nathan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numerator: UITextField!
    @IBOutlet weak var denominator: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    @IBAction func calcDecimal(sender: UIButton) {
        
        if let x = Int(numerator.text!), y = Int(denominator.text!) {
            calculateDecimal(Double(x), second: Double(y))
        } else {
            result.text = "Undefined"
        }
        
    }
    @IBAction func calcInverse(sender: UIButton) {

        if let x = Int(numerator.text!), y = Int(denominator.text!) {
            numerator.text = String(y)
            denominator.text = String(x)
            
            calculateDecimal(Double(y), second: Double(x))
        } else {
            result.text = "Undefined"
        }
        
    }
    
    func calculateDecimal(first: Double, second: Double) {
        if second == 0 {
            result.text = "Undefined"
        } else {
            let num = first / second
            result.text = String(num)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

