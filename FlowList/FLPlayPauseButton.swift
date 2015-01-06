//
//  FLIconButton.swift
//  FlowList
//
//  Created by Daniel on 1/4/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

@IBDesignable class FLPlayPauseButton: UIButton {

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.selected = true
        setupUI()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / 2
    }
    
    func setupUI() {
        
        let pausedIconImage = FLPauseIcon(frame: CGRectZero, iconColor: UIColor.FLCPlainWhite()).getImageWithSize(CGSizeMake(15, 24))
        let playIconImage = FLPlayIcon(frame: CGRectZero, iconColor: UIColor.FLCPlainWhite()).getImageWithSize(CGSizeMake(19, 24))
        
        setImage(pausedIconImage, forState: .Normal)
        setImage(playIconImage, forState: .Selected)
        backgroundColor = UIColor.FLCElectricBlue()
    }
    
    
    override func prepareForInterfaceBuilder() {
        self.selected = true
        setupUI()
    }
    
    
}
