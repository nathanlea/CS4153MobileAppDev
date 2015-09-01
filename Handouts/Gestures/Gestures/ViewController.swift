//
//  ViewController.swift
//  Gestures
//
//  Created by Blayne Mayfield on 8/27/15.
//  Copyright © 2015 Oklahoma State University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func panHandler(sender: UIPanGestureRecognizer) {
        // Get the distance.
        let distance = sender.translationInView(self.view)
        
        if let view = sender.view {
            view.center = CGPoint(x:view.center.x + distance.x,
                y:view.center.y + distance.y)
        }
        
        // Reset the distance.
        sender.setTranslation(CGPointZero, inView: self.view)
    }

}

