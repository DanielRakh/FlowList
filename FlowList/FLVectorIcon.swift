//
//  FLVectorIcon.swift
//  FlowList
//
//  Created by Daniel on 1/1/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLVectorIcon: MMScalableVectorView {
    
    var shapePath:UIBezierPath
    var fillColor:UIColor

    override init(frame: CGRect) {
        self.shapePath = UIBezierPath()
        self.fillColor = UIColor.whiteColor()
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        self.shapePath = UIBezierPath()
        self.fillColor = UIColor.whiteColor()
        super.init(coder: aDecoder)
        setup()
    }
    
    private func setup() {
        backgroundColor = UIColor.clearColor()
    }
    
    override func drawInCurrentContext() {
        //// General Declarations
        let context = UIGraphicsGetCurrentContext()
        let fillColor = self.fillColor
        fillColor.setFill()
        shapePath.fill()
    }


}
