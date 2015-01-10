//
//  FLFeedTrendingPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedTrendingPresenter: NSObject {
    
    var userInterface:FLFeedTrendingViewInput?
    var feedInteractor:FLFeedTrendingInteractor?
    var feedWireframe:FLFeedTrendingWireframe?
    var feedModuleDelegate:FLFeedModuleDelegate?

}


extension FLFeedTrendingPresenter:FLFeedTrendingViewOutput {
    
    func initialSetup() {
        feedInteractor?.initialSetup()
    }
    
    func queueSong(song:FLTrendingSongItem) {
        feedInteractor?.queueSong(song)
        feedModuleDelegate?.feedModuleDidSelectSong()
    }
}

extension FLFeedTrendingPresenter: FLFeedTrendingInteractorOutput {
    
    func foundTrendingSongs(songs:[FLTrendingSongItem]) {
        userInterface?.showTrendingSongs(songs)
    }
}
