//
//  FLUpvoteIcon.swift
//  FlowList
//
//  Created by Daniel on 1/1/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLUpvoteIcon: FLVectorIcon {
    
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
        var shapePath = UIBezierPath()
        shapePath.moveToPoint(CGPointMake(0, 14.84))
        shapePath.addLineToPoint(CGPointMake(3.33, 18.31))
        shapePath.addLineToPoint(CGPointMake(14.25, 6.93))
        shapePath.addLineToPoint(CGPointMake(25.18, 18.31))
        shapePath.addLineToPoint(CGPointMake(28.5, 14.84))
        shapePath.addLineToPoint(CGPointMake(14.25, 0))
        shapePath.addLineToPoint(CGPointMake(0, 14.84))
        shapePath.closePath()
        shapePath.miterLimit = 4;
        
        shapePath.usesEvenOddFillRule = true;

        
        return shapePath
    }

    
    override func originalSize() -> CGSize {
        return CGSizeMake(29, 18)
    }

}
