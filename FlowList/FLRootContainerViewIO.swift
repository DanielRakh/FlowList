//
//  FLRootContainerViewIO.swift
//  FlowList
//
//  Created by Daniel on 1/2/15.
//  Copyright (c) 2015 Daniel Rakhamimov. All rights reserved.
//

import Foundation

protocol FLRootContainerViewInput {
    
}

protocol FLRootContainerViewOutput {
    func setupFeedRootModule(feedRootViewController:FLFeedRootViewController)
    func setupPlayerModule(playerViewController:FLPlayerViewController)
    func playerViewDidRecognizeTap()
    func feedViewDidRecognizeTap()
}