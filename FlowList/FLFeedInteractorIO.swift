//
//  FLFeedInteractorIO.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLFeedInteractorInput {
    func initialSetup()
}

protocol FLFeedInteractorOutput {
    func foundAllSongs(songs:[FLSongItem])
}
