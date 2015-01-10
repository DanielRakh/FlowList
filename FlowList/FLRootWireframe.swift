//
//  FLRootWireframe.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

let FLRootContainerControllerIdentifer = "FLRootContainerController"


class FLRootWireframe : NSObject {
    
    var rootContainerPresenter: FLRootContainerPresenter?
    
    
    var feedWireframe: FLFeedRootWireframe?
    var playerWireframe: FLPlayerWireframe?
    
    func presentRootContainerViewControllerFromWindow(window:UIWindow) {
        let viewController = rootContainerControllerFromStoryboard()
        viewController.eventHandler = rootContainerPresenter
        rootContainerPresenter!.userInterface = viewController
        
        showRootViewController(viewController, inWindow: window)
        
    }
    
    func setupFeedRootInterfaceForViewController(controller:FLFeedRootViewController) {
        feedWireframe?.setupFeedRootInterfaceForViewController(controller)
    }
    
    func setupPlayerInterfaceFromViewController(controller:FLPlayerViewController) {
        playerWireframe?.setupPlayerInterfaceFromViewController(controller)
    }
    
    
    
    
    
    func showRootViewController(viewController: UIViewController, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController]
        navigationController.navigationBar.barTintColor = UIColor.FLCMightnightBlue()
    }
    
    func navigationControllerFromWindow(window: UIWindow) -> UINavigationController {
        let navigationController = window.rootViewController as UINavigationController
        return navigationController
    }
    
    
    func rootContainerControllerFromStoryboard() -> FLRootContainerController {
        let storyboard = mainStoryboard()
        let viewController = storyboard.instantiateViewControllerWithIdentifier(FLRootContainerControllerIdentifer) as FLRootContainerController
        return viewController
    }
    
    func mainStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        return storyboard
    }
}
