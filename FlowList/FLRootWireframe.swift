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
    var rootContainerViewController: FLRootContainerController?

    var feedWireframe: FLFeedRootWireframe?
    var playerWireframe: FLPlayerWireframe?
    
    func presentRootContainerViewControllerFromWindow(window:UIWindow) {
        rootContainerViewController = rootContainerControllerFromStoryboard()
        rootContainerViewController?.eventHandler = rootContainerPresenter
        rootContainerPresenter?.userInterface = rootContainerViewController
        showRootViewController(rootContainerViewController?, inWindow: window)
    }
    
    func setupFeedRootInterfaceForViewController(controller:FLFeedRootViewController) {
        feedWireframe?.setupFeedRootInterfaceForViewController(controller)
    }
    
    func setupPlayerInterfaceFromViewController(controller:FLPlayerViewController) {
        playerWireframe?.setupPlayerInterfaceFromViewController(controller)
    }
    
    func slidePlayerContainerView(shouldSlideOut:Bool) {
        
        rootContainerViewController?.bottomSpacePlayerContainerViewToSuperView.constant = shouldSlideOut ? 0 : -rootContainerViewController!.playerContainerView.bounds.size.height * 0.5
        
        let alpha:CGFloat = shouldSlideOut ? 0.35 : 1.0
        
        UIView.animateWithDuration(0.35,
            delay: 0.0,
            usingSpringWithDamping: 0.8,
            initialSpringVelocity: 0.5,
            options: UIViewAnimationOptions.CurveEaseInOut,
            animations: {
                self.rootContainerViewController!.feedContainerView.alpha = alpha
                self.rootContainerViewController!.view.layoutIfNeeded()
            }) { success in
            //
        }
        
    }
    
    func showRootViewController(viewController: UIViewController?, inWindow: UIWindow) {
        let navigationController = navigationControllerFromWindow(inWindow)
        navigationController.viewControllers = [viewController!]
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
