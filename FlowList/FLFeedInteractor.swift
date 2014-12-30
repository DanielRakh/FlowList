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
    
    var output:FLFeedInteractorOutput?
    
    init(dataManager:FLFeedDataManager) {
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


extension FLFeedInteractor: FLFeedInteractorInput {
    
    func initialSetup() {
        findAllSongs()
    }
     
}

