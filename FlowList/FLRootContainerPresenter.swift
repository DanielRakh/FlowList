//
//  FLRootContainerPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLRootContainerPresenter: NSObject {
    
    var rootWireframe:FLRootWireframe?
    var userInterface:FLRootContainerViewInput?
    
    func setupFeedRootModuleForViewController(viewController:FLFeedRootViewController) {
        rootWireframe?.setupFeedRootInterfaceForViewController(viewController)
    }
    
    func setupPlayerModuleForViewController(viewController:FLPlayerViewController) {
        rootWireframe?.setupPlayerInterfaceFromViewController(viewController)
    }
    
    func playerContainerViewShouldSlideOut(shouldSlideOut:Bool) {
        rootWireframe?.slidePlayerContainerView(shouldSlideOut)
    }
    
   
}

extension FLRootContainerPresenter:FLRootContainerViewOutput {
    
    func setupFeedRootModule(feedRootViewController:FLFeedRootViewController) {
        setupFeedRootModuleForViewController(feedRootViewController)
    }
    
    func setupPlayerModule(playerViewController:FLPlayerViewController) {
        setupPlayerModuleForViewController(playerViewController)
    }
    
    func playerViewDidRecognizeTap() {
        playerContainerViewShouldSlideOut(true)
    }
    
    func feedViewDidRecognizeTap() {
        playerContainerViewShouldSlideOut(false)
    }
    
}
