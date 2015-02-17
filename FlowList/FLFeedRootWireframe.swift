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
    
    func slidePlayerContainerView(slideTransition:PlayerViewAnimation) {
        
        rootContainerViewController?.bottomSpacePlayerContainerViewToSuperView.constant = slideTransition == .Out ? -rootContainerViewController!.playerContainerView.bounds.size.height : -70
        
        let alpha:CGFloat = slideTransition == .Out ? 0.50 : 0
        
        UIView.animateWithDuration(0.35,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.8,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                self.rootContainerViewController!.transparentView.alpha = alpha
                self.rootContainerViewController!.view.layoutIfNeeded()
            }) { success in
                //
        }
        
    }
    
}

