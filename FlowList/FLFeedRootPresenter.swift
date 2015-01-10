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
    
    func setupFeedTrendModuleForViewController(viewController:FLFeedTrendingTableViewController) {
        feedRootWireframe?.setupTrendingFeedRootInterfaceForViewController(viewController)
    }
    
    func setupFeedNewModuleForViewController(viewController:FLFeedNewTableViewController) {
        feedRootWireframe?.setupNewFeedRootInterfaceForViewController(viewController)
    }
    
    func setupFeedLikesModuleForViewController(viewController:FLFeedLikesTableViewController) {
        feedRootWireframe?.setupLikesFeedRootInterfaceForViewController(viewController)
    }
    
}


extension FLFeedRootPresenter: FLFeedRootViewOutput {
    
}
