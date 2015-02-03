//
//  FLBlurNavBar.swift
//  FlowList
//
//  Created by Daniel on 1/19/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

/*
Rules for the UX:

Scroll View controls the height of the Nav Bar.
Nav Bar must always be in collapsed or expanded state. 
If Nav bar is <= half of its height. It should animate automatically to collapsed mode and return the difference between that intial state and the collaped state to offset the scrollview.
Vice versa for > half of its height. 

So as a user you


*/

enum NavBarMode {
    case Collapse
    case Expand
}

class FLBlurNavBar: UIVisualEffectView {
    
    @IBOutlet weak var vibrancyEffectView:UIVisualEffectView!
    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var feedHeaderView:FLFeedHeaderView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        vibrancyEffectView.contentView.backgroundColor = UIColor.FLCHazyBlue()
        
        let attrString = NSAttributedString(
            string: "</FLOWLIST>",
            attributes:
            [NSForegroundColorAttributeName: UIColor.FLCElectricBlue(),
                NSKernAttributeName: 2,
                NSFontAttributeName: UIFont(name:"AvenirNext-DemiBold", size: CGFloat(20))!] as NSDictionary)
        titleLabel.attributedText = attrString
        titleLabel.sizeToFit()
    }
    
}
