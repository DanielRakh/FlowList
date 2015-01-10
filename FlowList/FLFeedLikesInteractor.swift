//
//  FLFeedLikesInteractor.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedLikesInteractor: NSObject {
   
    let dataManager:FLFeedLikesDataManager
    
    var output:FLFeedLikesInteractorOutput?
    
    init(dataManager:FLFeedLikesDataManager) {
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


extension FLFeedLikesInteractor: FLFeedLikesInteractorInput {
    
    func initialSetup() {
        findAllSongs()
    }
    
}