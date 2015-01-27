//
//  FLFeedPresenter.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

enum PlayerViewAnimation {
    case Out
    case In
}

class FLFeedRootPresenter: NSObject {
    
    var userInterface:FLFeedRootViewInput?
    var feedRootWireframe:FLFeedRootWireframe?
    
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
    
    func playerContainerViewShouldSlide(slideTransition:PlayerViewAnimation) {
        feedRootWireframe?.slidePlayerContainerView(slideTransition)
    }
    
    
    
}

extension FLFeedRootPresenter: FLFeedRootViewOutput {
    
    func setupPlayerModule(playerViewController:FLPlayerViewController) {
        setupPlayerModuleForViewController(playerViewController)
    }
    
    func playerViewDidRecognizeTap() {
        playerContainerViewShouldSlide(.Out)
    }
    
    func feedViewDidRecognizeTap() {
        playerContainerViewShouldSlide(.In)
    }
    
}


extension FLFeedRootPresenter: FLTrendingScrollViewDelegate {
    
    func userDidScrollDirection(direction: ScrollDirection, dragValue: CGFloat) {
        if direction == .Down {
            userInterface?.collapseNavBarWithValue(dragValue)
        } else {
            userInterface?.expandNavBarWithValue(dragValue)
        }
    }

    func userDidScrollFullyUp() {
        userInterface?.fullyExpandNavBar()
    }

    func userDidScrollFullyDown() {
        userInterface?.fullyCollapseNavBar()
    }
    
    
    
}
