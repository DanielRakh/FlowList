//
//  FLHairlineView.swift
//  FlowList
//
//  Created by Daniel on 1/12/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLHairlineView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderColor = UIColor(white: 0, alpha: 0.35).CGColor
        layer.borderWidth = (1.0 / UIScreen.mainScreen().scale) / 2
        backgroundColor = UIColor.clearColor()
    }
}
