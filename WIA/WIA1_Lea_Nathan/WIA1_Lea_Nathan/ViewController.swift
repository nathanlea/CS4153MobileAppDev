//
//  ViewController.swift
//  WIA1_Lea_Nathan
//
//  Created by LEA NATHAN H on 8/23/15.
//  Copyright © 2015 LEA NATHAN H. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Call Random Number to Word Function
        randomNumberToWord()
    }
    
    /************************************************************
    *
    * Function to pick a random number and print the word version
    * Ex. 762 Seven Hundred Sixty Two
    *
    ************************************************************/
    func randomNumberToWord () {
        for _ in 0..<10 {
            //Get Random Number
            let aRandomInteger: UInt32 = arc4random_uniform(1000)
            
            //Break Number apart into pieces
            //Get 100's place
            let hundreds: UInt32 = aRandomInteger / 100
            //Get 10's place
            let tens: UInt32 = (aRandomInteger - hundreds * 100) / 10
            //Get 1's place
            let ones: UInt32 = (aRandomInteger - hundreds * 100 - tens * 10)
            
            //Print into statement with numerical number
            print("The value \(aRandomInteger) is", appendNewline: false)
            
            //Print Word form of the Hundreds place
            printBasicNum(hundreds)
            //Print word hundred is the number is a larger than 99
            if hundreds != 0 {
                print(" Hundred", appendNewline: false)
            }
            //If not teen number then print tens and ones
            if tens != 1 {
                printTens(tens)
                printBasicNum(ones)
            } else {
                //If teen print teen word form
                printTeens(ones)
            }
            //Print blank line after printing statement
            print("");
            
        }

    }
    
    /************************************************************
    *
    * Function to print the a number that is in the teens (10-19)
    *
    ************************************************************/
    
    func printTeens(ones: UInt32) {
        switch ones {
        case 0:
            print(" Ten", appendNewline: false)
        case 1:
            print(" Eleven", appendNewline: false)
        case 2:
            print(" Twelve", appendNewline: false)
        case 3:
            print(" Thirteen", appendNewline: false)
        case 4:
            print(" Fourteen", appendNewline: false)
        case 5:
            print(" Fifteen", appendNewline: false)
        case 6:
            print(" Sixteen", appendNewline: false)
        case 7:
            print(" Seventeen", appendNewline: false)
        case 8:
            print(" Eighteen", appendNewline: false)
        case 9:
            print(" Nineteen", appendNewline: false)
        default:
            print("", appendNewline: false)
        }

    }

    
    /************************************************************
    *
    * Function to print the tens place numbers 20-99
    *
    ************************************************************/
    func printTens(num: UInt32) {
        switch num {
        //case 1:
            //Dont print anything here teens are handed in above case
        case 2:
            print(" Twenty", appendNewline: false)
        case 3:
            print(" Thirty", appendNewline: false)
        case 4:
            print(" Fourty", appendNewline: false)
        case 5:
            print(" Fifty", appendNewline: false)
        case 6:
            print(" Sixty", appendNewline: false)
        case 7:
            print(" Seventy", appendNewline: false)
        case 8:
            print(" Eighty", appendNewline: false)
        case 9:
            print(" Ninety", appendNewline: false)
        default:
            //If case is 0 then dont print anything
            print("", appendNewline: false)
        }
    }

    
    /************************************************************
    *
    * Function to print word form of number 1-9
    *
    ************************************************************/
    func printBasicNum(num: UInt32) {
        switch num {
        case 1:
            print(" One", appendNewline: false)
        case 2:
            print(" Two", appendNewline: false)
        case 3:
            print(" Three", appendNewline: false)
        case 4:
            print(" Four", appendNewline: false)
        case 5:
            print(" Five", appendNewline: false)
        case 6:
            print(" Six", appendNewline: false)
        case 7:
            print(" Seven", appendNewline: false)
        case 8:
            print(" Eight", appendNewline: false)
        case 9:
            print(" Nine", appendNewline: false)
        default:
            //If number is 0 no need to print
            print("", appendNewline: false)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

