//
//  FLLikeButton.swift
//  FlowList
//
//  Created by Daniel on 1/5/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

@IBDesignable class FLLikeButton: UIButton {

    enum ButtonMode {
        case Like
        case Unlike
    }
    
    let coloredHeartImage = FLHeartIcon(frame: CGRectZero, iconColor: UIColor.FLCPlainWhite()).getImageWithSize(CGSizeMake(14, 12))
    
    let uncoloredHeartImage = FLHeartIcon(frame: CGRectZero, iconColor: UIColor.FLCUnselectedGray()).getImageWithSize(CGSizeMake(14, 12))
    
    var buttonMode:ButtonMode = .Unlike {
        willSet {
            let imageToSet = newValue == .Unlike ? uncoloredHeartImage : coloredHeartImage
            backgroundColor = newValue == .Unlike ? UIColor.FLCMightnightBlue() : UIColor.FLCCherryRed()
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
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width / 2
    }
    
    func setupUI() {
        setImage(uncoloredHeartImage, forState: .Normal)
        backgroundColor = UIColor.FLCMightnightBlue()
    }
    
    override func prepareForInterfaceBuilder() {
        setupUI()
    }

}
