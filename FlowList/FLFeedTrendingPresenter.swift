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
    var scrollViewDelegate:FLTrendingScrollViewDelegate?
}


extension FLFeedTrendingPresenter:FLFeedTrendingViewOutput {
    
    func initialSetup() {
        feedInteractor?.initialSetup()
    }
    
    func queueSong(song:FLTrendingSongItem) {
        feedInteractor?.queueSong(song)
        feedModuleDelegate?.feedModuleDidSelectSong()
    }
    
    func scrollViewDidScrollWithDragValue(dragValue: CGFloat, direction: ScrollDirection) {
        scrollViewDelegate?.userDidScrollDirection(direction, dragValue: dragValue)
    }
    
    func scrollViewIsFullyScrolledUp() {
        scrollViewDelegate?.userDidScrollFullyUp()
    }
    
    func scrollViewWillEndDraggingScrollingUp() {
        scrollViewDelegate?.userDidScrollFullyUp()

    }
    
    func scrollViewWillEndDraggingScrollingDown() {
        scrollViewDelegate?.userDidScrollFullyDown()
    }
}

extension FLFeedTrendingPresenter: FLFeedTrendingInteractorOutput {
    
    func foundTrendingSongs(songs:[FLTrendingSongItem]) {
        userInterface?.showTrendingSongs(songs)
    }
    
}
