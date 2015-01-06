//
//  FLUpvoteButton.swift
//  FlowList
//
//  Created by Daniel on 1/6/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

@IBDesignable class FLUpvoteButton: UIButton {
    
    enum ButtonMode {
        case Selected
        case Unselected
    }
    
    let coloredUpvoteImage = FLUpvoteIcon(frame: CGRectZero, iconColor: UIColor.FLCElectricBlue()).getImageWithSize(CGSizeMake(30, 18))
    
    let uncoloredUpvoteImage = FLUpvoteIcon(frame: CGRectZero, iconColor: UIColor.FLCUnselectedGray()).getImageWithSize(CGSizeMake(30, 18))
    
    var buttonMode:ButtonMode = .Unselected {
        willSet {
            let imageToSet = newValue == .Unselected ? uncoloredUpvoteImage : coloredUpvoteImage
            setImage(imageToSet, forState: .Normal)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    func setupUI() {
        setImage(uncoloredUpvoteImage, forState: .Normal)
        backgroundColor = UIColor.clearColor()
    }
    
    override func prepareForInterfaceBuilder() {
        setupUI()
    }


}
