//
//  SongItem.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

struct TrendingSongItem : Equatable {
    let songTitle : String = "Test"
    
    init(songTitle: String) {
        self.songTitle = songTitle
    }
}

func == (leftSide: TrendingSongItem, rightSide: TrendingSongItem) -> Bool {
    
    var hasEqualSections = false
    
    hasEqualSections = rightSide.songTitle == leftSide.songTitle
    
    if hasEqualSections == false {
        return false
    }
    
    return hasEqualSections
}

