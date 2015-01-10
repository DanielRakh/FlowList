//
//  FLPlayerDataManger.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLPlayerDataManger: NSObject {
    
    var coreDataStore:FLCoreDataStack?
    
    func songItemsFromDataStoreQueue(completion: (([FLSongItem]) -> Void)!) {
        
        coreDataStore?.fetchAllEntries{ managedSongItems in
            
           let songItems = managedSongItems.map {
            
                FLSongItem(title: $0.title,
                    creator: $0.creator,
                    streamURL: $0.streamURL,
                    milliSecondsDuration: ($0.milliSecondsDuration as NSNumber).doubleValue,
                    soundcloudId: ($0.soundCloudID as NSString).doubleValue)
            }
        
            completion(songItems)
        }
    }
}
