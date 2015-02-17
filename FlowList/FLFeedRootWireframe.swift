//
//  FLFeedWireframe.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

let FLFeedRootContainerControllerIdentifer = "FLFeedRootContainerController"


class FLFeedRootWireframe: NSObject {
    
    var rootPresenter:FLFeedRootPresenter?
    var rootContainerViewController: FLFeedRootViewController?
    
    var playerWireframe: FLPlayerWireframe?
    var trendingWireframe:FLFeedTrendingWireframe?
    var newWireframe:FLFeedNewWireframe?
    var likesWireframe:FLFeedLikesWireframe?
    
    
    func presentRootContainerViewControllerFromWindow(window:UIWindow) {
        rootContainerViewController = window.rootViewController as? FLFeedRootViewController
        rootContainerViewController?.eventHandler = rootPresenter
        rootPresenter?.userInterface = rootContainerViewController
    }
    
    func setupTrendingFeedRootInterfaceForViewController(viewController:FLFeedTrendingTableViewController) {
        trendingWireframe?.setupTrendingFeedInterfaceFromViewController(viewController)
    }
    
    func setupNewFeedRootInterfaceForViewController(viewController:FLFeedNewTableViewController) {
        newWireframe?.setupNewFeedInterfaceFromViewController(viewController)
    }
    
    func setupLikesFeedRootInterfaceForViewController(viewController:FLFeedLikesTableViewController) {
        likesWireframe?.setupLikesFeedInterfaceFromViewController(viewController)
    }
    
    func setupPlayerInterfaceFromViewController(controller:FLPlayerViewController) {
        playerWireframe?.setupPlayerInterfaceFromViewController(controller)
    }
    
    
}

