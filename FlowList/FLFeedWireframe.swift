//
//  FLFeedWireframe.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

let FeedViewControllerIdentifier = "FLFeedViewController"

class FLFeedWireframe:NSObject {
    
    var rootWireframe: FLRootWireframe?
    var feedViewController: FLFeedViewController?
    var feedPresenter: FLFeedPresenter?
    
    func presentFeedInterfaceFromWindow(window:UIWindow) {
        let viewController = feedViewControllerFromStoryboard()
        viewController.eventHandler = feedPresenter
        feedViewController = viewController
        feedPresenter!.userInterface = viewController
        rootWireframe!.showRootViewController(viewController, inWindow: window)
        
    }
    
    
    func feedViewControllerFromStoryboard() -> FLFeedViewController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(FeedViewControllerIdentifier) as FLFeedViewController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}