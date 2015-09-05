//
//  MyView.swift
//  WIA3_lea_nathan
//
//  Created by Nathan on 9/5/15.
//  Copyright © 2015 Okstate. All rights reserved.
//

import UIKit

class MyView : UIView {
    
    override func drawRect(rect: CGRect) {
        
        let colorOrange = UIColor(red: 1.0, green: 0.65, blue: 0.0, alpha: 1.0)
        
        // Fetch the context of the view.
        let context = UIGraphicsGetCurrentContext()
        
        // Save the current context.
        CGContextSaveGState(context)
        
        CGContextSetFillColorWithColor(context, colorOrange.CGColor)
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)
        
        // Create an array of points defining an arrow
        let w = self.bounds.size.width / 2
        let h = self.bounds.size.height / 2
        
        let pointsArrow = [
            CGPoint(x: w + 100, y: h),
            CGPoint(x: w, y: h + 50),
            CGPoint(x: w, y: h + 25),
            CGPoint(x: w - 100, y: h + 25),
            CGPoint(x: w - 100, y: h - 25),
            CGPoint(x: w, y: h - 25),
            CGPoint(x: w, y: h - 50)
        ]
        // Create an empty path.
        let path = CGPathCreateMutable()
        
        // Move to the first point in the path.
        CGPathMoveToPoint(path, nil, pointsArrow[0].x, pointsArrow[0].y)
        // Add the other points to the path.
        CGPathAddLineToPoint(path, nil, pointsArrow[1].x, pointsArrow[1].y)
        CGPathAddLineToPoint(path, nil, pointsArrow[2].x, pointsArrow[2].y)
        CGPathAddLineToPoint(path, nil, pointsArrow[3].x, pointsArrow[3].y)
        CGPathAddLineToPoint(path, nil, pointsArrow[4].x, pointsArrow[4].y)
        CGPathAddLineToPoint(path, nil, pointsArrow[5].x, pointsArrow[5].y)
        CGPathAddLineToPoint(path, nil, pointsArrow[6].x, pointsArrow[6].y)
        // Close the path.
        CGPathCloseSubpath(path)
        
        // Add the path to the context.
        CGContextAddPath(context, path)
        
        // Fill the path.
        CGContextFillPath(context)
        // Since the previous operation emptied the context's path,
        // we must re-add the path to the context.
        CGContextAddPath(context, path)
        // Stroke the path.
        CGContextStrokePath(context)
        
        // Restore the saved context.
        CGContextRestoreGState(context)
        
        
        //=============================
        
        // The string to be drawn
        let text: NSString = "OSU"
        // The font to use.
        let font = UIFont(name: "Helvetica Bold", size: 50.0)
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
            text.drawInRect(CGRect(x:w - 60, y:h - 30, width:w + 75, height: h + 25), withAttributes: textFontAttributes)
        }
        
    }
    
    
}


