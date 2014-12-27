//
//  ListInteractor.swift
//  FlowList
//
//  Created by Daniel on 12/26/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

protocol ListInteractorInput {
    func findTrendingSongs()
}

protocol ListInteractorOutput {
    
    func foundTrendingSongs(songs:[TrendingSongItem])
}

class ListInteractor: NSObject {
    
    let dataManager:ListDataManager
    var output:ListInteractorOutput?
    
    init(dataManager:ListDataManager) {
        self.dataManager = dataManager
    }
    
    
    func trendingSongsForSongItems(songItems:[SongItem]) -> [TrendingSongItem] {
        
        let mappedArray = songItems.map({song in
            TrendingSongItem(songTitle: (song as SongItem).songTitle)
        })
        return mappedArray
    }
    
}


extension ListInteractor:ListInteractorInput {
    func findTrendingSongs()  {
        
        let songs = dataManager.trendingSongs()
        let trendingSongs = trendingSongsForSongItems(songs)
        output?.foundTrendingSongs(trendingSongs)
    }
    
    
}
