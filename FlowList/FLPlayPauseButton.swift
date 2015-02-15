//
//  FLIconButton.swift
//  FlowList
//
//  Created by Daniel on 1/4/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

@IBDesignable class FLPlayPauseButton: UIButton {

    enum ButtonMode {
        case Play
        case Pause
    }
    
    let pausedIconImage = FLPauseIcon(frame: CGRectZero, iconColor: UIColor.FLCPlainWhite()).getImageWithSize(CGSizeMake(15, 24))

    let playIconImage = FLPlayIcon(frame: CGRectZero, iconColor: UIColor.FLCPlainWhite()).getImageWithSize(CGSizeMake(19, 24))
    
    var buttonMode:ButtonMode = .Play {
        
        willSet {
            let imageToSet = newValue == .Pause ? pausedIconImage : playIconImage
            setImage(imageToSet, forState: .Normal)
            
            var leftInset:CGFloat = newValue == .Pause ? 0 : 4
            imageEdgeInsets = UIEdgeInsetsMake(0, leftInset, 0, 0)

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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.size.width / 2

    }
    
    
    func setupUI() {
        
        setImage(playIconImage, forState: .Normal)
        backgroundColor = UIColor.FLCElectricBlue()
        imageEdgeInsets = UIEdgeInsetsMake(0, 4, 0, 0)
    }
    
    
    override func prepareForInterfaceBuilder() {
        setupUI()
    }
    
}
