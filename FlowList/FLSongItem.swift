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
    let username:String
    let streamURL:String
    let milliSecondsDuration:Double
    let soundcloudId:Double

    init(title:String, username:String, streamURL:String, milliSecondsDuration:Double, soundcloudId:Double) {
    
        self.title = title
        self.username = username
        self.streamURL = streamURL
        self.milliSecondsDuration = milliSecondsDuration
        self.soundcloudId = soundcloudId
    }
    
}

func ==(lhs: FLSongItem, rhs: FLSongItem) -> Bool {
    
    return  lhs.title == rhs.title &&
            lhs.username == rhs.username &&
            lhs.streamURL == rhs.streamURL &&
            lhs.milliSecondsDuration == rhs.milliSecondsDuration &&
            lhs.soundcloudId == rhs.soundcloudId
}
