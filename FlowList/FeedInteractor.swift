//
//  FeedInteractor.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

class FeedInteractor {
    
    func findAllSongs() ->[SongItem] {
        
        var songs = [SongItem]()
        for i in 1...10 {
            let song = SongItem(title: "", creator: "", urlString: "", secondsDuration: 1000.0)
            songs += [song]
        }
        
        return songs
    }
} 

