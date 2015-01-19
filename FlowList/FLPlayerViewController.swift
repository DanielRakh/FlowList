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

    @IBOutlet weak var backgroundBlurView: UIVisualEffectView!
    @IBOutlet weak var vibrancyBackground: UIVisualEffectView!
    @IBOutlet weak var topPlayerContainerView: UIView!
    @IBOutlet weak var hairlineView: FLHairlineView!
    @IBOutlet weak var creatorTitleLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var playButton: FLPlayPauseButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.clearColor()
        vibrancyBackground.contentView.backgroundColor = UIColor.FLCHazyBlue()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundBlurView.frame = CGRectMake(0, 0, backgroundBlurView.bounds.size.width, backgroundBlurView.bounds.size.height)
        println("Layout:\(backgroundBlurView)")
        println(view)
        
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
    
    func setupInterfaceForSong(song:FLSongItem) {
        creatorTitleLabel.text = song.creator
        songTitleLabel.text = song.title
    }
    
}