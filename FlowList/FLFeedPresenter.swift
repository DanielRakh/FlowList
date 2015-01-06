//
//  FLFeedPresenter.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedPresenter: NSObject {
    
    var userInterface:FLFeedViewInput?
    var feedInteractor:FLFeedInteractor?
    var feedWireframe:FLFeedWireframe?
}

extension FLFeedPresenter:FLFeedViewOutput {
    
    func initialSetup() {
        feedInteractor?.initialSetup()
    }
}

extension FLFeedPresenter: FLFeedInteractorOutput {
    
    func foundAllSongs(songs:[FLSongItem]) {
        userInterface?.showSongs(songs)
    }
}
