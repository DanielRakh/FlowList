//
//  FLScrubberSlider.swift
//  FlowList
//
//  Created by Daniel on 1/12/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLScrubberSlider: UISlider {
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        setThumbImage(UIImage(named: "PlayerSliderThumbImage"), forState: .Normal)
        
        setMaximumTrackImage(UIImage(named: "PlayerSliderMaximumTrackImage")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 4, 0, 4), resizingMode: .Stretch), forState: .Normal)
        
        setMinimumTrackImage(UIImage(named: "PlayerSliderMinimumTrackImage")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 4, 0, 4), resizingMode: .Stretch), forState: .Normal)
    }

}
