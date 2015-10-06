//
//  ViewController.swift
//  WIA7_Lea_Nathan
//
//  Created by Nathan on 10/5/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AtomicClockDelegate {

    @IBOutlet weak var secondSinceString: UILabel!
    @IBOutlet weak var timeString: UILabel!
    
    var atomicClock: AtomicClock = AtomicClock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tickTock()
        atomicClock.start()
        atomicClock.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tickTock() {
        timeString.text = atomicClock.timeAsString()
        secondSinceString.text = atomicClock.timeAsSeondsString
    }
}

protocol AtomicClockProtocol {
    func tickTock()
}

protocol AtomicClockDelegate {
    func tickTock()
}

class AtomicClock {
    var delegate: AtomicClockDelegate?
    var timer: NSTimer?
    var hour: Int = 0 {
        didSet {
            if hour == 24 {
                hour = 0
            }
        }
    }
    var minute: Int = 0 {
        didSet {
            if minute == 60 {
                minute = 0
                hour++
            }
        }
    }
    var second: Int = 0{
        didSet {
            if second == 60 {
                second = 0
                minute++
            }
        }
    }
    
    var timeAsSeondsString: String {
        get {
            let secondsSinceMidnight = (hour * 3600) + (minute*60) + second
            return String(secondsSinceMidnight)
        }
    }
    
    func timeAsString() -> String {
        
        if hour > 12 {
            let SHour = NSString(format: "%02d:", hour-12)
            let SMin = NSString(format: "%02d:", minute)
            let SSec = NSString(format: "%02d", second)
            return String(SHour) + String(SMin) + String(SSec) + String(" PM")
        } else {
            let SHour = NSString(format: "%02d:", hour)
            let SMin = NSString(format: "%02d:", minute)
            let SSec = NSString(format: "%02d", second)
            return String(SHour) + String(SMin) + String(SSec) + String(" AM")
        }
        
    }
    
    @objc func incrementTime() {
        second++
        if let d = delegate {
            d.tickTock()
        }
    }
    
    func start() {
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "incrementTime", userInfo: nil, repeats: true)
    }
    init () {
        hour = 11
        minute = 59
        second = 50
    }
    
    
    
}

