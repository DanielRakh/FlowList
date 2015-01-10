//
//  FLFeedNewPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedNewPresenter: NSObject {
    
    var userInterface:FLFeedNewViewInput?
    var feedInteractor:FLFeedNewInteractor?
    var feedWireframe:FLFeedNewWireframe?
    
}


extension FLFeedNewPresenter:FLFeedNewViewOutput {
    
    func initialSetup() {
        feedInteractor?.initialSetup()
    }
}

extension FLFeedNewPresenter: FLFeedNewInteractorOutput {
    
    func foundAllSongs(songs:[FLSongItem]) {
        userInterface?.showSongs(songs)
    }
}