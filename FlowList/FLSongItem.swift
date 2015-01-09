//
//  SongItem.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

struct FLSongItem:Equatable {

    let title:String
    let creator:String
    let streamURL:String
    let milliSecondsDuration:Double
    let soundcloudId:Double

    init(title:String, creator:String, streamURL:String, milliSecondsDuration:Double, soundcloudId:Double) {
    
        self.title = title
        self.creator = creator
        self.streamURL = streamURL
        self.milliSecondsDuration = milliSecondsDuration
        self.soundcloudId = soundcloudId
    }
    
}

func ==(lhs: FLSongItem, rhs: FLSongItem) -> Bool {
    
    return  lhs.title == rhs.title &&
            lhs.creator == rhs.creator &&
            lhs.streamURL == rhs.streamURL &&
            lhs.milliSecondsDuration == rhs.milliSecondsDuration &&
            lhs.soundcloudId == rhs.soundcloudId
}
