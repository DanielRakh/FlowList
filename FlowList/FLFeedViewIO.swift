//
//  FLFeedViewInput.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLFeedViewInput {
    func showSongs(songs:[FLSongItem])
}

protocol FLFeedViewOutput {
    func initialSetup()
}