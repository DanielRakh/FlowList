//
//  FLFeedNewViewIO.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation


protocol FLFeedNewViewInput {
    func showSongs(songs:[FLSongItem])
}

protocol FLFeedNewViewOutput {
    func initialSetup()
}
