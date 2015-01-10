//
//  FLPlayerInteractor.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerInteractor: NSObject {
   
    let dataManager:FLPlayerDataManger?
    
    var output:FLPlayerInteractorOutput?
    
    init(dataManager:FLPlayerDataManger) {
        self.dataManager = dataManager
    }

}


extension FLPlayerInteractor: FLPlayerInteractorInput {
    
    func returnQueuedSong() {
        dataManager?.songItemsFromDataStoreQueue { songItems in
//            self.output?
        }
    }
    
    
}
