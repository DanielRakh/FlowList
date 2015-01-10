//
//  FLFeedNewDataManager.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedNewDataManager: NSObject {

    let feedNetworkService = FLFeedNetworkService()
    
    func fetchSongsForQuery(query:String, onFailure fail:(NSError -> Void)? = nil, onSuccess succeed:([FLSongItem] -> Void)? = nil) {
        
        feedNetworkService.fetchDataForQuery(query,
            onFailure: { error in
                if let didFail = fail {
                    didFail(error)
                }
            }, onSuccess: {json in
                if let didSucceed = succeed {
                    let songItems = self.songItemsFromJSONResponse(json)
                    didSucceed(songItems)
                }
        })
    }
    
    func songItemsFromJSONResponse(json:AnyObject) -> [FLSongItem] {
        
        let songsArray = JSON(json)["tracks"].arrayObject?.map{ track in
            FLSongItem(title: track["title"] as String,
                creator:track["user_name"] as String ,
                streamURL:track["stream_url"] as String,
                milliSecondsDuration: track["duration"] as Double,
                soundcloudId: track["soundcloud_id"] as Double)
        }
        
        return songsArray!
        
    }
    
    
    
}
