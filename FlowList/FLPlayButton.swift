//
//  FLPlayButton.swift
//  FlowList
//
//  Created by Daniel on 1/3/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

@IBDesignable class FLPlayButton: UIView {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func layoutSubviews() {
        setup()
    }
    
    func setup() {
        backgroundColor = UIColor.FLCElectricBlue()
        layer.cornerRadius = bounds.size.width / 2.0
    }
    
    
    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    
 
}