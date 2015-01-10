//
//  FLFeedInteractorIO.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLFeedTrendingInteractorInput {
    func initialSetup()
}

protocol FLFeedTrendingInteractorOutput {
    func foundTrendingSongs(songs:[FLTrendingSongItem])
}
