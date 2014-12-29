//
//  FeedInteractor.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

class FLFeedInteractor:NSObject {
    
    func findAllSongs() ->[FLSongItem] {
        
        var songs = [FLSongItem]()
        for i in 1...10 {
            let song = FLSongItem(title: "", creator: "", urlString: "", secondsDuration: 1000.0)
            songs += [song]
        }
        
        return songs
    }
} 

