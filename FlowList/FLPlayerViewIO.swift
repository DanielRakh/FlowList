//
//  FLPlayerViewIO.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation


protocol FLPlayerViewInput {
    
    func setupInterfaceForSong(song:FLSongItem)
    
}

protocol FLPlayerViewOutput {
    
    func playButtonDidTouch()
    
    func pauseButtonDidTouch()
    
    func likeButtonDidTouch()
    
    func unlikeButtonDidTouch()
}