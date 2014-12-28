//
//  ListDataManager.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class ListDataManager: NSObject {
    
    func trendingSongs() -> [SongItem] {
        
        var songItemArray = [SongItem]()
        for item in 1...10 {
            let songItem = SongItem(songTitle: "\(item)")
            songItemArray += [songItem]
        }
        return songItemArray
    }
    
}
