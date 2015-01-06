//
//  FLHeartIcon.swift
//  FlowList
//
//  Created by Daniel on 1/5/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLHeartIcon: FLVectorIcon {
    
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
        shapePath.moveToPoint(CGPointMake(23.04, 0.36))
        shapePath.addCurveToPoint(CGPointMake(14, 4.92), controlPoint1: CGPointMake(19.3, -0.87), controlPoint2: CGPointMake(15.29, 1.17))
        shapePath.addCurveToPoint(CGPointMake(4.97, 0.36), controlPoint1: CGPointMake(12.72, 1.17), controlPoint2: CGPointMake(8.7, -0.87))
        shapePath.addCurveToPoint(CGPointMake(0.35, 9.55), controlPoint1: CGPointMake(1.19, 1.6), controlPoint2: CGPointMake(-0.87, 5.71))
        shapePath.addCurveToPoint(CGPointMake(13.88, 23), controlPoint1: CGPointMake(1.53, 13.2), controlPoint2: CGPointMake(12.48, 23))
        shapePath.addCurveToPoint(CGPointMake(27.64, 9.55), controlPoint1: CGPointMake(15.28, 23), controlPoint2: CGPointMake(26.46, 13.22))
        shapePath.addCurveToPoint(CGPointMake(23.04, 0.36), controlPoint1: CGPointMake(28.87, 5.7), controlPoint2: CGPointMake(26.81, 1.59))
        shapePath.addLineToPoint(CGPointMake(23.04, 0.36))
        shapePath.closePath()
        shapePath.miterLimit = 4;
        
        shapePath.usesEvenOddFillRule = true;
        
        return shapePath
    }
    
    
    override func originalSize() -> CGSize {
        return CGSizeMake(28, 23)
    }
    
    

}
