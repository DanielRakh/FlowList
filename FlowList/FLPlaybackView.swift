//
//  FLPlaybackView.swift
//  FlowList
//
//  Created by Daniel on 12/20/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit


@objc protocol FLPlaybackViewDelegate {
    
    optional func playTapped()
    optional func pauseTapped()
    optional func updateTime()
    
}

class FLPlaybackView: UIView {
    
    @IBOutlet weak var playButton:UIButton!
    @IBOutlet weak var trackScrubber:UISlider!
    @IBOutlet weak var trackTimeElapsedLabel:UILabel!
    @IBOutlet weak var tracktimeDurationLabel:UILabel!
    
    weak var delegate:FLPlaybackViewDelegate?
    
    var isPaused = true
    var isScrubbing = false
    
    var timer:NSTimer = NSTimer()
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @IBAction func playbackButtonTapped(sender:UIButton!) {
        
        
        self.timer.invalidate()
        
        if isPaused == true {
            sender.setTitle("Pause", forState: .Normal)
            timer = NSTimer(timeInterval: 1.0, target: self, selector: "updateTime:", userInfo: nil, repeats: true)
            delegate?.playTapped!()
            isPaused = false
        } else {
            delegate?.pauseTapped!()
            sender.setTitle("Play", forState: .Normal)
            isPaused = true
        }
    }
    
    
    
    
    @IBAction func userIsScrubbing(sender:UISlider!) {
        isScrubbing = true
    }
    
    
//    func updateTime(sender:NSTimer) {
//        if isScrubbing == false {
//            trackScrubber.value =
//        }
//    }
    
}
