//
//  ViewController.swift
//  WIA3_lea_nathan
//
//  Created by Nathan on 9/5/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newView = CustomView(frame: CGRectMake(75,250, 250, 150))
        self.view.addSubview(newView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

