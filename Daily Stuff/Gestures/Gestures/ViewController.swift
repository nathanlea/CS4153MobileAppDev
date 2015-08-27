//
//  ViewController.swift
//  Gestures
//
//  Created by LEA NATHAN H on 8/27/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
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
        let distance = sender.translationInView(self.view)
        
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + distance.x, y: view.center.y + distance.y)
        }
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    @IBAction func pinchHandler(sender: UIPinchGestureRecognizer) {
        // Get the pinch scale.
        let scale = sender.scale
        // Resize the image based on the pinch scale.
        if let view = sender.view {
            view.transform = CGAffineTransformScale(view.transform, scale, scale)
        }
        // Reset the pinch scale to 1 for incremental processing.
        sender.scale = 1
    }
}

