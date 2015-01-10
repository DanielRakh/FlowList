//
//  FLFeedWireframe.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedRootWireframe:NSObject {
    
    var rootPresenter:FLFeedRootPresenter?
    
    var trendingWireframe:FLFeedTrendingWireframe?
    var newWireframe:FLFeedNewWireframe?
    var likesWireframe:FLFeedLikesWireframe?


    
    func setupFeedRootInterfaceForViewController(viewController:FLFeedRootViewController) {
        viewController.eventHandler = rootPresenter
        rootPresenter!.userInterface = viewController
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
    
}

