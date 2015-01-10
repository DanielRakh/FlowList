//
//  FLTrendingSongItem.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation

struct FLTrendingSongItem:Equatable {
    
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

func ==(lhs: FLTrendingSongItem, rhs: FLTrendingSongItem) -> Bool {
    
    return  lhs.title == rhs.title &&
        lhs.creator == rhs.creator &&
        lhs.streamURL == rhs.streamURL &&
        lhs.milliSecondsDuration == rhs.milliSecondsDuration &&
        lhs.soundcloudId == rhs.soundcloudId
}
