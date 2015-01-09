//
//  FLFeedWireframe.swift
//  FlowList
//
//  Created by Daniel on 12/29/14.
//  Copyright (c) 2014 Daniel Rakhamimov. All rights reserved.
//

import UIKit

class FLFeedWireframe:NSObject {
    
    var feedPresenter: FLFeedPresenter?
    
    func setupFeedInterfaceFromViewController(viewController:FLFeedRootViewController) {
        viewController.eventHandler = feedPresenter
    }
    
}