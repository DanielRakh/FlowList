//
//  FLFeedLikesPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedLikesPresenter: NSObject {
    
    var userInterface:FLFeedLikesViewInput?
    var feedInteractor:FLFeedLikesInteractor?
    var feedWireframe:FLFeedLikesWireframe?
    
}

extension FLFeedLikesPresenter:FLFeedLikesViewOutput {
    
    func initialSetup() {
        feedInteractor?.initialSetup()
    }
}

extension FLFeedLikesPresenter: FLFeedLikesInteractorOutput {
    
    func foundAllSongs(songs:[FLSongItem]) {
        userInterface?.showSongs(songs)
    }
}