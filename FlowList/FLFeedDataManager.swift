//
//  FLFeedDataManager.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation


class FLFeedDataManager:NSObject {
    
    let feedNetworkService = FLFeedNetworkService()
    
    func fetchSongsForQuery(query:String) {
        feedNetworkService.fetchDataForQuery(query)
    }
    
    func fetchedSongs(query:String) {
        
    }
}


