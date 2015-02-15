//
//  FLAvatarButton.swift
//  FlowList
//
//  Created by Daniel on 2/14/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit


class FLAvatarButton: UIButton {
    
    var avatarImage:UIImage?
    
    init(frame: CGRect, avatar:UIImage) {
        avatarImage = avatar
        super.init(frame: frame)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupUI()
    }
    
    func setupUI() {
        imageView?.contentMode = .ScaleAspectFit
        layer.cornerRadius = bounds.size.width / 2.0
        setBackgroundImage(UIImage(named: "TestAvatarImage"), forState: .Normal)
        clipsToBounds = true
    }
}
