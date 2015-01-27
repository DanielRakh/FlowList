//
//  FLFeedTrendingWireframe.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedTrendingWireframe: NSObject {
    
    var trendingPresenter: FLFeedTrendingPresenter?
    
    func setupTrendingFeedInterfaceFromViewController(viewController:FLFeedTrendingTableViewController) {
        viewController.eventHandler = trendingPresenter
        trendingPresenter?.userInterface = viewController
    }
   
}
