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

    func userWillEndDragging() {
        scrollViewDelegate?.scrollViewWillEndDragging() 
    }
}

extension FLFeedTrendingPresenter: FLFeedTrendingInteractorOutput {
    
    func foundTrendingSongs(songs:[FLTrendingSongItem]) {
        userInterface?.showTrendingSongs(songs)
    }
    
}

extension FLFeedTrendingPresenter: FLBlurNavBarInterface {
    
//    func navBarIsMidAnimation() {
//        userInterface?.navBarIsMidAnimation()
//        
//    }
//    
//    func navBarIsExpanded() {
//        userInterface?.navBarIsExpanded()
//
//    }
//    
//    func navBarIsCollapsed() {
//        userInterface?.navBarIsCollapsed()
//
//    }
    
    func navBarHasExpandedBy(value:CGFloat) {
        userInterface?.offSetScrollViewBy(value)
    }
    
    func navBarHasCollapsedBy(value:CGFloat) {
        userInterface?.offSetScrollViewBy(value)
        
    }
}
