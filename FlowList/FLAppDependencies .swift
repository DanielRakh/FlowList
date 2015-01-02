//
//  FLAppDependencies .swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLAppDependencies {
    
    let rootWireframe = FLRootWireframe()
    
    init() {
        configureDependencies()
    }

    func installRootViewControllerIntoWindow(window:UIWindow) {
        rootWireframe.presentRootContainerViewControllerFromWindow(window)
        
    }

    func configureDependencies() {
        
        let rootPresenter = FLRootContainerPresenter()
        rootPresenter.rootWireframe = rootWireframe
        rootWireframe.rootContainerPresenter = rootPresenter
        
        
        let feedWireframe = FLFeedWireframe()
        
        rootWireframe.feedWireframe = feedWireframe

        let feedPresenter = FLFeedPresenter()
        let feedDataManager = FLFeedDataManager()
        let feedInteractor = FLFeedInteractor(dataManager: feedDataManager)
        
        feedPresenter.feedInteractor = feedInteractor
        feedPresenter.feedWireframe = feedWireframe
        
        feedWireframe.feedPresenter = feedPresenter
        
        feedInteractor.output = feedPresenter
        
        
        
        let playerWireframe = FLPlayerWireframe()
        
        rootWireframe.playerWireframe = playerWireframe
        
        let playerPresenter = FLPlayerPresenter()
        let playerDataManager = FLPlayerDataManger()
        let playerInteractor = FLPlayerInteractor(dataManager: playerDataManager)
        
        playerPresenter.playerInteractor = playerInteractor
        playerPresenter.playerWireframe = playerWireframe
        
        playerWireframe.playerPresenter = playerPresenter
        
        playerInteractor.output = playerPresenter
        
    }
}