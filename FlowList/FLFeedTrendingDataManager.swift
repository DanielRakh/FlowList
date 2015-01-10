//
//  FLFeedDataManager.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation


class FLFeedTrendingDataManager:NSObject {
    
    var dataStore:FLCoreDataStack?
    
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
        let songsArray = JSON(json)["songs"].arrayObject?.map{ track in
            FLSongItem(title: track["title"] as String,
                creator:track["user_name"] as String ,
                streamURL:track["stream_url"] as String,
                milliSecondsDuration: track["duration"] as Double,
                soundcloudId: track["soundcloud_id"] as Double)
        }
        
        return songsArray!
        
    }
    
    func queueNewSong(song:FLSongItem) {
        
        let newSongItem = dataStore?.newSongItem() as FLManagedSongItem!
        newSongItem.title = song.title
        newSongItem.creator = song.creator
        newSongItem.soundCloudID = "\(song.soundcloudId)"
        newSongItem.streamURL = song.streamURL
        newSongItem.milliSecondsDuration = NSNumber(double: song.milliSecondsDuration)
        
        dataStore?.saveContext()
        
    }
    

    

}


