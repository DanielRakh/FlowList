//
//  FLAppDependencies .swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLAppDependencies {
    
    let feedRootWireframe = FLFeedRootWireframe()

    
    init() {
        configureDependencies()
    }

    func installRootViewControllerIntoWindow(window:UIWindow) {
        feedRootWireframe.presentRootContainerViewControllerFromWindow(window)
        
    }

    func configureDependencies() {

        let feedRootPresenter = FLFeedRootPresenter()
        feedRootPresenter.feedRootWireframe = feedRootWireframe
        feedRootWireframe.rootPresenter = feedRootPresenter
        
        
        let coreDataStore = FLCoreDataStack()
        
        
        let playerWireframe = FLPlayerWireframe()
        
        feedRootWireframe.playerWireframe = playerWireframe
        
        let playerPresenter = FLPlayerPresenter()
        let playerDataManager = FLPlayerDataManger()
        playerDataManager.coreDataStore = coreDataStore
        let playerInteractor = FLPlayerInteractor(dataManager: playerDataManager)
        
        playerPresenter.playerInteractorInput = playerInteractor
        playerPresenter.playerWireframe = playerWireframe
        
        playerWireframe.playerPresenter = playerPresenter
        
        playerInteractor.output = playerPresenter
        
        
        
        let trendingWireframe = FLFeedTrendingWireframe()
        feedRootWireframe.trendingWireframe = trendingWireframe
        
        let trendingPresenter = FLFeedTrendingPresenter()

        let trendingDataManager = FLFeedTrendingDataManager()
        trendingDataManager.dataStore = coreDataStore
        let trendingInteractor = FLFeedTrendingInteractor(dataManager: trendingDataManager)
        
        trendingPresenter.feedInteractor = trendingInteractor
        trendingPresenter.feedWireframe = trendingWireframe
        trendingPresenter.feedModuleDelegate = playerPresenter
        trendingPresenter.scrollViewDelegate = feedRootPresenter
        
        trendingWireframe.trendingPresenter = trendingPresenter
        
        trendingInteractor.output = trendingPresenter
        
        
        feedRootPresenter.blurNavBarInterface = trendingPresenter
        
        
        
        let newWireframe = FLFeedNewWireframe()
        feedRootWireframe.newWireframe = newWireframe
        
        let newPresenter = FLFeedNewPresenter()
        let newDataManager = FLFeedNewDataManager()
        let newInteractor = FLFeedNewInteractor(dataManager: newDataManager)
        
        newPresenter.feedInteractor = newInteractor
        newPresenter.feedWireframe = newWireframe
        
        newWireframe.newPresenter = newPresenter
        
        newInteractor.output = newPresenter
        
        
        let likesWireframe = FLFeedLikesWireframe()
        feedRootWireframe.likesWireframe = likesWireframe
        
        let likesPresenter = FLFeedLikesPresenter()
        let likesDataManager = FLFeedLikesDataManager()
        let likesInteractor = FLFeedLikesInteractor(dataManager: likesDataManager)
        
        likesPresenter.feedInteractor = likesInteractor
        likesPresenter.feedWireframe = likesWireframe
        
        likesWireframe.likesPresenter = likesPresenter
        
        likesInteractor.output = likesPresenter
        
        
        
        
        
    }
}