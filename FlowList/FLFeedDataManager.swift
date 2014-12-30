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
    
    func fetchSongsForQuery(query:String) -> [FLSongItem]? {
        
        var songItems:[FLSongItem]?
        
        feedNetworkService.fetchDataForQuery(query, completion: { (response, error) in
            if error != nil {
                println(error)
            } else {
                songItems = self.songItemsFromJSONResponse(response!)
            }
        })
        
        return songItems
    }
    
    
    func songItemsFromJSONResponse(json:AnyObject) -> [FLSongItem] {
        
        let jsonObject = JSON(json)
        let tracksJSON = jsonObject["tracks"]
        let tracksArray = tracksJSON.arrayObject
        let songsArray = tracksArray?.map{ track in
            FLSongItem(title: track["title"] as String,
                username:track["user_name"] as String ,
                streamURL:track["stream_url"] as String,
                milliSecondsDuration: track["duration"] as Double,
                soundcloudId: track["soundcloud_id"] as Double)
        }
    
        println(reflect(songsArray![0] as FLSongItem))
        
        return songsArray!
    }
    
    
    

}


