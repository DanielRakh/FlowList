//
//  FLAppDependencies .swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLAppDependencies {
    
    var feedWireframe = FLFeedWireframe()
    
    init() {
        configureDependencies()
    }

    func installRootViewControllerIntoWindow(window:UIWindow) {
        feedWireframe.presentFeedInterfaceFromWindow(window)
    }

    func configureDependencies() {
        
        let rootWireframe = FLRootWireframe()
        let feedPresenter = FLFeedPresenter()
        let feedDataManager = FLFeedDataManager()
        let feedInteractor = FLFeedInteractor(dataManager: feedDataManager)
        
        feedPresenter.feedInteractor = feedInteractor
        feedPresenter.feedWireframe = feedWireframe
        
        feedWireframe.feedPresenter = feedPresenter
        feedWireframe.rootWireframe = rootWireframe
    }
}