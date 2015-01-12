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

    @IBOutlet weak var topPlayerContainerView: UIView!
    @IBOutlet weak var hairlineView: FLHairlineView!
    @IBOutlet weak var creatorTitleLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var playButton: FLPlayPauseButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.FLCHazyBlue()
        // Do any additional setup after loading the view.
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        hairlineView.frame = CGRectMake(0, 0, hairlineView.bounds.size.width, hairlineView.bounds.size.height)
        topPlayerContainerView.frame = CGRectMake(0, 0, topPlayerContainerView.bounds.size.width, topPlayerContainerView.bounds.size.height)
        
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