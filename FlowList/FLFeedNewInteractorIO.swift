//
//  FLFeedNewInteractorIO.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLFeedNewInteractorInput {
    func initialSetup()
}

protocol FLFeedNewInteractorOutput {
    func foundAllSongs(songs:[FLSongItem])
}

