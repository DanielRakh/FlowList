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
    var playerInteractorInput:FLPlayerInteractorInput?
    var playerWireframe:FLPlayerWireframe?
    let audioManager = FLPlayerAudioManager.shared
    var songs:[FLSongItem]?
}

extension FLPlayerPresenter:FLPlayerViewOutput {
    
    func playButtonDidTouch() {
        //TODO: Check if song is already playing
        playSong()
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
    
    func playSong() {
        let URL = NSURL(string: (songs?[0] as FLSongItem!).streamURL)
        audioManager.playItemForURL(URL!)
    }
    
}


extension FLPlayerPresenter: FLPlayerInteractorOutput {
    
    func queuedSongs(songs:[FLSongItem]) {
        self.songs = songs
        userInterface?.setupInterfaceForSong(songs[0])
    }
}


extension FLPlayerPresenter: FLFeedModuleDelegate {
    
    func feedModuleDidSelectSong() {
        playerInteractorInput?.returnNextQueuedSong()
    }
}










