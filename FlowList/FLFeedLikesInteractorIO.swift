//
//  FLFeedLikesInteractorIO.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLFeedLikesInteractorInput {
    func initialSetup()
}

protocol FLFeedLikesInteractorOutput {
    func foundAllSongs(songs:[FLSongItem])
}
