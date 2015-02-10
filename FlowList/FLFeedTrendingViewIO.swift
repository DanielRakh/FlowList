//
//  FLFeedViewInput.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLFeedTrendingViewInput {
    func showTrendingSongs(songs:[FLTrendingSongItem])
    
    
    func offSetScrollViewBy(value:Float)
    
}

protocol FLFeedTrendingViewOutput {
    func initialSetup()
    func queueSong(song:FLTrendingSongItem)
    
    func scrollViewDidScrollWithDragValue(dragValue:Float, direction:ScrollDirection)
    func userWillEndDragging(direction:ScrollDirection)
    func userWillEndDraggingWeakly(direction withDirection:ScrollDirection?)
    func userWillBeginDragging()
    
}
