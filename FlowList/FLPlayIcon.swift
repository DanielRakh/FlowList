//
//  FLPlayIcon.swift
//  FlowList
//
//  Created by Daniel on 1/3/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

@IBDesignable class FLPlayIcon: FLVectorIcon {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    func setup() {
        shapePath = iconShape()
        fillColor = UIColor.whiteColor()
    }
    
    
    func iconShape() -> UIBezierPath {
        var bezier2Path = UIBezierPath()
        bezier2Path.moveToPoint(CGPointMake(0, 0))
        bezier2Path.addLineToPoint(CGPointMake(0, 14))
        bezier2Path.addLineToPoint(CGPointMake(11, 7))
        bezier2Path.addLineToPoint(CGPointMake(0, 0))
        bezier2Path.closePath()
        bezier2Path.miterLimit = 4;
        
        
        return bezier2Path
    }
    
    
    override func originalSize() -> CGSize {
        return CGSizeMake(11, 14)
    }
   
}
