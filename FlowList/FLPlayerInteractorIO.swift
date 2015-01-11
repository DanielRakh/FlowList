//
//  FLPlayerInteractorIO.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLPlayerInteractorInput {
    func returnNextQueuedSong()
}
protocol FLPlayerInteractorOutput {
    func queuedSongs(songs:[FLSongItem])
}
