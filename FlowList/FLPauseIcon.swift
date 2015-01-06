//
//  FLPauseIcon.swift
//  FlowList
//
//  Created by Daniel on 1/3/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPauseIcon: FLVectorIcon {
    
    
    init(frame:CGRect, iconColor:UIColor) {
        super.init(frame: frame)
        setupWithColor(iconColor)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupWithColor(UIColor.whiteColor())
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupWithColor(UIColor.whiteColor())
    }
    
    func setupWithColor(iconColor:UIColor?) {
        backgroundColor = UIColor.clearColor()
        shapePath = iconShape()
        if let color = iconColor {
            fillColor = color
        }
    }
    
    
    func iconShape() -> UIBezierPath {
        
        var rectangle26Path = UIBezierPath()
        rectangle26Path.moveToPoint(CGPointMake(0, 0))
        rectangle26Path.addLineToPoint(CGPointMake(6, 0))
        rectangle26Path.addLineToPoint(CGPointMake(6, 35))
        rectangle26Path.addLineToPoint(CGPointMake(0, 35))
        rectangle26Path.addLineToPoint(CGPointMake(0, 0))
        rectangle26Path.closePath()
        rectangle26Path.moveToPoint(CGPointMake(16, 0))
        rectangle26Path.addLineToPoint(CGPointMake(22, 0))
        rectangle26Path.addLineToPoint(CGPointMake(22, 35))
        rectangle26Path.addLineToPoint(CGPointMake(16, 35))
        rectangle26Path.addLineToPoint(CGPointMake(16, 0))
        rectangle26Path.closePath()
        rectangle26Path.miterLimit = 4;
        
        rectangle26Path.usesEvenOddFillRule = true;
        
        return rectangle26Path
    }
    
    
    override func originalSize() -> CGSize {
        return CGSizeMake(22, 35)
    }
    
}
