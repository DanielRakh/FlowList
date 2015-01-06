//
//  FLPlayerViewController.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerViewController: UIViewController {

    var eventHandler:FLPlayerPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.FLCHazyBlue()
        // Do any additional setup after loading the view.
    }
    
    
    //MARK:
    //MARK:IBActions
    @IBAction func playPauseButtonDidTouch(sender: FLPlayPauseButton) {
        
        if sender.buttonMode == .Play {
            eventHandler?.pauseButtonDidTouch()
            sender.buttonMode = .Pause
        } else {
            eventHandler?.playButtonDidTouch()
            sender.buttonMode = .Play
        }
    }
    
    @IBAction func likeButtonDidTouch(sender: FLLikeButton) {
        if sender.buttonMode == .Like {
            eventHandler?.unlikeButtonDidTouch()
            sender.buttonMode = .Unlike
        } else {
            eventHandler?.likeButtonDidTouch()
            sender.buttonMode = .Like
        }
    }

}


extension FLPlayerViewController: FLPlayerViewInput {
    
}