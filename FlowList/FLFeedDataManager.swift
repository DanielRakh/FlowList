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
        feedNetworkService.fetchDataForQuery(query,
            failure: { error in
            println("Data Manager Error")
            }, success: { object in
                println("Data Manager Object \(object)")
        })
    }
    
    func fetchedSongs(query:String) {
        
    }
}


