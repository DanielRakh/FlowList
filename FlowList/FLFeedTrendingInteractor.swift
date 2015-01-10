//
//  FeedInteractor.swift
//  FlowList
//
//  Created by Daniel on 12/28/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

class FLFeedTrendingInteractor:NSObject {
    
    let dataManager:FLFeedTrendingDataManager
    
    var output:FLFeedTrendingInteractorOutput?
    
    init(dataManager:FLFeedTrendingDataManager) {
        self.dataManager = dataManager
    }

    func findTrendingSongs() {
        
        dataManager.fetchSongsForQuery("Boiler Room", onFailure: { error in
            println("There was an error fetching the songs\(error.localizedDescription)")
            }, onSuccess: { songItems in
                
                let trendingSongs = self.trendingSongsForSongItems(songItems)
                self.output?.foundTrendingSongs(trendingSongs)
        })
    }
    
    func trendingSongsForSongItems(songItems:[FLSongItem]) -> [FLTrendingSongItem] {
        
       return songItems.map({
            FLTrendingSongItem(title: $0.title, creator: $0.creator, streamURL: $0.streamURL, milliSecondsDuration: $0.milliSecondsDuration, soundcloudId: $0.soundcloudId)
        })
    }
    
}


extension FLFeedTrendingInteractor: FLFeedTrendingInteractorInput {
    
    func initialSetup() {
        findTrendingSongs()
    }
    
}

