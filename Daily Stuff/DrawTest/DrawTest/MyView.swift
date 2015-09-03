//
//  MyView.swift
//  DrawTest
//
//  Created by Blayne Mayfield on 9/1/15.
//  Copyright © 2015 Oklahoma State University. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    override func drawRect(rect: CGRect) {
        // Load the contents of the image file.
        if let myImage = UIImage(named: "LilPete.png") {
            // Draw at center of display.
            let p = CGPoint(x: (self.bounds.size.width - myImage.size.width) / 2,
                y:(self.bounds.size.height - myImage.size.height) / 2)
        
            myImage.drawAtPoint(p)
            
////          Draw in upper-left corner, 1/2 width
            let rect = CGRect(x: 0, y: 0,
                    width: myImage.size.width / 2, height: myImage.size.height)
            myImage.drawInRect(rect)
        }
        else {
            NSLog("No image file found")
        }
        
//=============================
        
        let colorOrange = UIColor(red: 1.0, green: 0.65, blue: 0.0, alpha: 1.0)
    
        /*if*/ let context = UIGraphicsGetCurrentContext()
        //{
            // Save the current context.
            CGContextSaveGState(context)
            
            CGContextSetFillColorWithColor(context, colorOrange.CGColor)
            CGContextSetStrokeColorWithColor(context, colorOrange.CGColor)
            
            // Create an array of points defining a triangle.
            let pointsTriangle = [
                CGPoint(x:self.bounds.size.width / 2 - 50, y:200),
                CGPoint(x:self.bounds.size.width / 2 + 50, y:200),
                CGPoint(x:self.bounds.size.width / 2, y:50)
            ]
            // Create an empty path.
            let path = CGPathCreateMutable()
            
            // Move to the first point in the path.
            CGPathMoveToPoint(path, nil, pointsTriangle[0].x, pointsTriangle[0].y)
            // Add the other points to the path.
            CGPathAddLineToPoint(path, nil, pointsTriangle[1].x, pointsTriangle[1].y)
            CGPathAddLineToPoint(path, nil, pointsTriangle[2].x, pointsTriangle[2].y)
            // Close the path.
            CGPathCloseSubpath(path)
            
            // Add the path to the context.
            CGContextAddPath(context, path)
            
            // Stroke and fill the path.
            CGContextFillPath(context)
            
            // Restore the saved context.
            CGContextRestoreGState(context)
        //}
        
//=============================
        
        // The string to be drawn
        let text: NSString = "Pistol Pete"
        // The font to use.
        let font = UIFont(name: "Helvetica Bold", size: 14.0)
        // The paragraph style of the text.
        let textStyle = NSMutableParagraphStyle.defaultParagraphStyle().mutableCopy() as! NSMutableParagraphStyle
        // The alignment of the paragraph.
        textStyle.alignment = NSTextAlignment.Left
        if let actualFont = font {
            let textFontAttributes = [
                NSFontAttributeName: actualFont,
                NSForegroundColorAttributeName: UIColor.blackColor(),
                NSParagraphStyleAttributeName: textStyle
            ]
            
            // Draw the text in a rect.
            text.drawInRect(CGRect(x:50, y:320, width:125, height:18), withAttributes: textFontAttributes)
        }
        
    }
}
