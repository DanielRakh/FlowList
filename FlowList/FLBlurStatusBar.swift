//
//  FLBlurStatusBar.swift
//  FlowList
//
//  Created by Daniel on 2/8/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLBlurStatusBar: UIVisualEffectView {
    
    @IBOutlet weak var vibrancyEffectView:UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    func setupUI() {
        backgroundColor = UIColor.clearColor()
        contentView.backgroundColor = UIColor.clearColor()
        vibrancyEffectView.contentView.backgroundColor = UIColor.FLCHazyBlue()
    }
    
}
