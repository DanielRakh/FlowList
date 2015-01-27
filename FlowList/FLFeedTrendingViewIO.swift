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
}

protocol FLFeedTrendingViewOutput {
    func initialSetup()
    func queueSong(song:FLTrendingSongItem)
    func scrollViewDidScrollWithDragValue(dragValue:CGFloat, direction:ScrollDirection)
    func scrollViewWillEndDraggingWithDragValue(dragValue:CGFloat)
    
}
