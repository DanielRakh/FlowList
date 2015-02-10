//
//  FLFeedRootViewIO.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation


protocol FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:Float)
    func collapseNavBarWithValue(value:Float)
    func finishNavBarTransition()
    func collapseNavBar(#returnOffset:Bool)
    func expandNavBar(#returnOffset:Bool)
    func startNavBarTransition()
}

protocol FLFeedRootViewOutput {
    func setupPlayerModule(playerViewController:FLPlayerViewController)
    func playerViewDidRecognizeTap()
    func feedViewDidRecognizeTap()
    
//    func navBarIsInMidAnimation()
//    func navBarIsExpanded()
//    func navBarIsCollapsed()
    
    func navBarHasExpandedBy(value:Float)
    func navBarHasCollapsedBy(value:Float)
    
    
}

