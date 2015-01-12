//
//  FLRootContainerPresenter.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import UIKit

enum PlayerViewAnimation {
    case Out
    case In
}

class FLRootContainerPresenter: NSObject {
    
    var rootWireframe:FLRootWireframe?
    var userInterface:FLRootContainerViewInput?
    
    func setupFeedRootModuleForViewController(viewController:FLFeedRootViewController) {
        rootWireframe?.setupFeedRootInterfaceForViewController(viewController)
    }
    
    func setupPlayerModuleForViewController(viewController:FLPlayerViewController) {
        rootWireframe?.setupPlayerInterfaceFromViewController(viewController)
    }
    
    func playerContainerViewShouldSlide(slideTransition:PlayerViewAnimation) {
        rootWireframe?.slidePlayerContainerView(slideTransition)
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
        playerContainerViewShouldSlide(.Out)
    }
    
    func feedViewDidRecognizeTap() {
        playerContainerViewShouldSlide(.In)
    }
    
}
