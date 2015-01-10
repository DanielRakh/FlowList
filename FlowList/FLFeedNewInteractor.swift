//
//  FLFeedNewInteractor.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedNewInteractor: NSObject {
    
    let dataManager:FLFeedNewDataManager
    
    var output:FLFeedNewInteractorOutput?
    
    init(dataManager:FLFeedNewDataManager) {
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


extension FLFeedNewInteractor: FLFeedNewInteractorInput {
    
    func initialSetup() {
        findAllSongs()
    }
    
}