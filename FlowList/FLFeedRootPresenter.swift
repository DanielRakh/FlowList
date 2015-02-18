//
//  FLFeedPresenter.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit


class FLFeedRootPresenter: NSObject {
    
    var userInterface:FLFeedRootViewInput?
    var feedRootWireframe:FLFeedRootWireframe?
    var blurNavBarInterface:FLBlurNavBarInterface?
    
    
    
    func setupFeedTrendModuleForViewController(viewController:FLFeedTrendingTableViewController) {
        feedRootWireframe?.setupTrendingFeedRootInterfaceForViewController(viewController)
    }
    
    func setupFeedNewModuleForViewController(viewController:FLFeedNewTableViewController) {
        feedRootWireframe?.setupNewFeedRootInterfaceForViewController(viewController)
    }
    
    func setupFeedLikesModuleForViewController(viewController:FLFeedLikesTableViewController) {
        feedRootWireframe?.setupLikesFeedRootInterfaceForViewController(viewController)
    }
    
    func setupPlayerModuleForViewController(viewController:FLPlayerViewController) {
        feedRootWireframe?.setupPlayerInterfaceFromViewController(viewController)
    }

    
}

extension FLFeedRootPresenter: FLFeedRootViewOutput {
    
    func setupPlayerModule(playerViewController:FLPlayerViewController) {
        setupPlayerModuleForViewController(playerViewController)
    }
    
    func navBarHasExpandedBy(value:Float) {
        blurNavBarInterface?.navBarHasExpandedBy(value)
    }
    
    func navBarHasCollapsedBy(value:Float) {
        blurNavBarInterface?.navBarHasCollapsedBy(value)
    }
    
    
}


extension FLFeedRootPresenter: FLTrendingScrollViewDelegate {
    
    func userDidScrollDirection(direction: ScrollDirection, dragValue: Float) {
        if direction == .Down {
            userInterface?.collapseNavBarWithValue(dragValue)
        } else {
            userInterface?.expandNavBarWithValue(dragValue)
        }
    }
    
    func scrollViewWillEndDragging(direction:ScrollDirection) {
        
        if direction == .Down {
            userInterface?.collapseNavBar(returnOffset: false)
        } else {
            userInterface?.expandNavBar(returnOffset: false)
        }
        
    }
    
    
    func scrollViewWillBeginDragging() {
        userInterface?.startNavBarTransition()
    }
    
    func userWillEndDraggingWeakly(direction withDirection:ScrollDirection?) {
        if let scrollDirection = withDirection {
            if scrollDirection == .Down {
                userInterface?.collapseNavBar(returnOffset: true)
            } else {
                userInterface?.expandNavBar(returnOffset: true)
            }
        } else {
            userInterface?.finishNavBarTransition()
        }
    }
    
}
