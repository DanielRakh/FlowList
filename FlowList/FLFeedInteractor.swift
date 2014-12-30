//
//  FeedInteractor.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

class FLFeedInteractor:NSObject {
    
    let dataManager:FLFeedDataManager
    
    init(dataManager:FLFeedDataManager) {
        self.dataManager = dataManager
    }
    
    func findAllSongs() ->[FLSongItem]? {
        
        return dataManager.fetchSongsForQuery("Richie Hawtin")?
    }
}


extension FLFeedInteractor: FLFeedInteractorInput {
    
    func initialSetup() {
        findAllSongs()
    }
     
}

