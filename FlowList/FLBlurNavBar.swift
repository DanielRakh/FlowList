//
//  FLBlurNavBar.swift
//  FlowList
//
//  Created by Daniel on 1/19/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

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
