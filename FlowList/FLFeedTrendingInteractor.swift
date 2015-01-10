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

    func findAllSongs() {
        
        dataManager.fetchSongsForQuery("Boiler Room", onFailure: { error in
            println("There was an error fetching the songs\(error.localizedDescription)")
            }, onSuccess: { songItems in
               if let interactorOutput = self.output {
                    interactorOutput.foundAllSongs(songItems)
                }
        })
    }
}


extension FLFeedTrendingInteractor: FLFeedTrendingInteractorInput {
    
    func initialSetup() {
        findAllSongs()
    }
    
}

