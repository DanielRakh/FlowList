//
//  FLPlayerPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerPresenter: NSObject {

    var userInterface:FLPlayerViewInput?
    var playerInteractor:FLPlayerInteractor?
    var playerWireframe:FLPlayerWireframe?
}

extension FLPlayerPresenter:FLPlayerViewOutput {
    
    func playButtonDidTouch() {
        //TODO: Check if song is already playing
        
    }
    
    func pauseButtonDidTouch() {
        //TODO: Check if song is already paused
        
    }
    
    func likeButtonDidTouch() {
        //TODO: Check if song is already liked
        
    }
    
    func unlikeButtonDidTouch() {
        //TODO: Check if song is already unliked
        
    }
}


extension FLPlayerPresenter: FLPlayerInteractorOutput {
}
