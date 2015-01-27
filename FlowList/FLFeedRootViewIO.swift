//
//  FLFeedRootViewIO.swift
//  FlowList
//
//  Created by Daniel on 1/10/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation


protocol FLFeedRootViewInput {
    
    func expandNavBarWithValue(value:CGFloat)
    func collapseNavBarWithValue(value:CGFloat)
    func fullyExpandNavBar()
    func fullyCollapseNavBar()
}

protocol FLFeedRootViewOutput {
    func setupPlayerModule(playerViewController:FLPlayerViewController)
    func playerViewDidRecognizeTap()
    func feedViewDidRecognizeTap()
}

