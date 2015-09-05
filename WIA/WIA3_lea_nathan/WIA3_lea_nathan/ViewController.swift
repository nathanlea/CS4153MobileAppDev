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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func panRecongnizer(sender: UIPanGestureRecognizer) {
        let distance = sender.translationInView(self.view)
        
        if let view = sender.view {
            view.center = CGPoint(x: view.center.x + distance.x, y: view.center.y + distance.y)
        }
        sender.setTranslation(CGPointZero, inView: self.view)
    }
    
    @IBAction func pinchRecongnizer(sender: UIPinchGestureRecognizer) {
        // Get the pinch scale.
        let scale = sender.scale
        // Resize the image based on the pinch scale.
        if let view = sender.view {
            view.transform = CGAffineTransformScale(view.transform, scale, scale)
        }
        // Reset the pinch scale to 1 for incremental processing.
        sender.scale = 1
    }
    
    
    @IBAction func rotateRecongnizer(sender: UIRotationGestureRecognizer) {
        if let view = sender.view {
            view.transform = CGAffineTransformRotate(view.transform, sender.rotation)
            sender.rotation = 0;
        }
    }
}

